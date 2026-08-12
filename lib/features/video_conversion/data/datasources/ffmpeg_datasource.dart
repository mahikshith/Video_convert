import 'dart:async';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_new_full/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_full/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter_new_full/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new_full/return_code.dart';
import 'package:ffmpeg_kit_flutter_new_full/statistics.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/core/services/encoding_settings_resolver.dart';
import 'package:video_converter_pro/core/services/ffmpeg_command_builder.dart';
import 'package:video_converter_pro/core/services/logger_service.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/gif_creation/domain/entities/gif_options.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_progress.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';

class FfmpegDataSource {
  FfmpegDataSource({
    FfmpegCommandBuilder? commandBuilder,
    EncodingSettingsResolver? settingsResolver,
  })  : _commandBuilder = commandBuilder ?? const FfmpegCommandBuilder(),
        _settingsResolver = settingsResolver ?? const EncodingSettingsResolver();

  final FfmpegCommandBuilder _commandBuilder;
  final EncodingSettingsResolver _settingsResolver;
  FFmpegSession? _activeSession;
  bool _cancelRequested = false;

  Future<Duration> probeDuration(String inputPath) async {
    final session = await FFprobeKit.getMediaInformation(inputPath);
    final durationSeconds =
        double.tryParse(session.getMediaInformation()?.getDuration() ?? '');
    if (durationSeconds == null) {
      throw const ProbeFailure('Could not determine video duration.');
    }
    return Duration(milliseconds: (durationSeconds * 1000).round());
  }

  /// Cancels the in-flight conversion. Safe to call before the FFmpeg session
  /// exists (i.e. while the input is still being probed): the flag makes the
  /// pending [convert] abort instead of starting an unstoppable session.
  Future<void> cancel() async {
    _cancelRequested = true;
    final session = _activeSession;
    if (session == null) return;
    await FFmpegKit.cancel(session.getSessionId());
  }

  Stream<ConversionProgress> convert({
    required String inputPath,
    required String outputPath,
    required OutputFormat outputFormat,
    ConversionPreset? preset,
    GifOptions? gifOptions,
  }) {
    final controller = StreamController<ConversionProgress>();
    final stopwatch = Stopwatch();
    _cancelRequested = false;

    // If the listener walks away (navigation, provider disposal, a stream
    // error) the FFmpeg session would otherwise keep encoding in the
    // background for the rest of the app's life.
    controller.onCancel = () async {
      final session = _activeSession;
      if (session == null) return;
      _activeSession = null;
      await FFmpegKit.cancel(session.getSessionId());
    };

    Future<void> run() async {
      try {
        final totalDuration = await probeDuration(inputPath);

        final List<String> args;
        Duration progressDuration = totalDuration;
        switch (outputFormat.kind) {
          case OutputKind.video:
            final settings = preset == null
                ? null
                : _settingsResolver.resolve(
                    preset,
                    inputDuration: totalDuration,
                  );
            args = _commandBuilder.buildConvertCommand(
              inputPath: inputPath,
              outputPath: outputPath,
              format: outputFormat,
              settings: settings,
              h264Encoder: _resolveH264Encoder(),
            );
          case OutputKind.audio:
            args = _commandBuilder.buildAudioExtractCommand(
              inputPath: inputPath,
              outputPath: outputPath,
              format: outputFormat,
            );
          case OutputKind.gif:
            final options = gifOptions ??
                GifOptions(start: Duration.zero, end: totalDuration, fps: 12);
            args = _commandBuilder.buildGifCommand(
              inputPath: inputPath,
              outputPath: outputPath,
              options: options,
            );
            final clipDuration = options.end - options.start;
            // An empty or inverted range means FFmpeg encodes to the end of
            // the input, so scale progress against the full duration rather
            // than a non-positive value that would suppress every update.
            progressDuration =
                clipDuration > Duration.zero ? clipDuration : totalDuration;
        }

        if (_cancelRequested) {
          controller.addError(const ConversionCancelledFailure());
          await controller.close();
          return;
        }

        stopwatch.start();

        final session = await FFmpegKit.executeWithArgumentsAsync(
          args,
          (session) async {
            stopwatch.stop();
            _activeSession = null;
            if (controller.isClosed) return;
            final returnCode = await session.getReturnCode();
            if (ReturnCode.isSuccess(returnCode)) {
              controller.add(
                ConversionProgress(percent: 1.0, elapsed: stopwatch.elapsed),
              );
              await controller.close();
            } else if (ReturnCode.isCancel(returnCode)) {
              controller.addError(const ConversionCancelledFailure());
              await controller.close();
            } else {
              final logs = await session.getAllLogsAsString();
              controller.addError(
                ConversionFailure(
                  'FFmpeg exited with code ${returnCode?.getValue()}',
                  ffmpegLogs: logs,
                ),
              );
              await controller.close();
            }
          },
          (log) => LoggerService.info(log.getMessage(), tag: 'FFmpeg'),
          (Statistics stats) {
            // A statistics event can still land after the completion callback
            // closed the controller; adding to it then throws.
            if (controller.isClosed) return;
            if (progressDuration.inMilliseconds <= 0) return;
            final percent =
                (stats.getTime() / progressDuration.inMilliseconds)
                    .clamp(0.0, 1.0);
            controller.add(
              ConversionProgress(percent: percent, elapsed: stopwatch.elapsed),
            );
          },
        );

        if (controller.isClosed) return;
        _activeSession = session;
        // cancel() may have been called while the session was starting up.
        if (_cancelRequested) {
          await FFmpegKit.cancel(session.getSessionId());
        }
      } catch (e) {
        if (!controller.isClosed) {
          controller.addError(e is Failure ? e : ConversionFailure('$e'));
          await controller.close();
        }
      }
    }

    unawaited(run());
    return controller.stream;
  }

  /// This LGPL build has no software H.264 encoder (see docs/DECISIONS.md),
  /// so MP4/MOV/MKV output goes through the platform's hardware encoder.
  /// iOS and macOS use VideoToolbox; everything else (in practice, only
  /// Android — this app doesn't ship to desktop/web) uses MediaCodec.
  String _resolveH264Encoder() {
    if (Platform.isIOS || Platform.isMacOS) return 'h264_videotoolbox';
    return 'h264_mediacodec';
  }
}
