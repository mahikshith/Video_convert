import 'dart:async';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:ffmpeg_kit_flutter_new/statistics.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/core/services/encoding_settings_resolver.dart';
import 'package:video_converter_pro/core/services/ffmpeg_command_builder.dart';
import 'package:video_converter_pro/core/services/logger_service.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_progress.dart';

class FfmpegDataSource {
  FfmpegDataSource({
    FfmpegCommandBuilder? commandBuilder,
    EncodingSettingsResolver? settingsResolver,
  })  : _commandBuilder = commandBuilder ?? const FfmpegCommandBuilder(),
        _settingsResolver = settingsResolver ?? const EncodingSettingsResolver();

  final FfmpegCommandBuilder _commandBuilder;
  final EncodingSettingsResolver _settingsResolver;
  FFmpegSession? _activeSession;

  Future<Duration> probeDuration(String inputPath) async {
    final session = await FFprobeKit.getMediaInformation(inputPath);
    final durationSeconds =
        double.tryParse(session.getMediaInformation()?.getDuration() ?? '');
    if (durationSeconds == null) {
      throw const ProbeFailure('Could not determine video duration.');
    }
    return Duration(milliseconds: (durationSeconds * 1000).round());
  }

  Future<void> cancel() async {
    final session = _activeSession;
    if (session == null) return;
    await FFmpegKit.cancel(session.getSessionId());
  }

  Stream<ConversionProgress> convert({
    required String inputPath,
    required String outputPath,
    ConversionPreset? preset,
  }) {
    final controller = StreamController<ConversionProgress>();
    final stopwatch = Stopwatch();

    Future<void> run() async {
      try {
        final totalDuration = await probeDuration(inputPath);
        final settings = preset == null
            ? null
            : _settingsResolver.resolve(preset, inputDuration: totalDuration);
        final args = _commandBuilder.buildConvertCommand(
          inputPath: inputPath,
          outputPath: outputPath,
          settings: settings,
        );
        stopwatch.start();

        _activeSession = await FFmpegKit.executeWithArgumentsAsync(
          args,
          (session) async {
            stopwatch.stop();
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
            if (totalDuration.inMilliseconds <= 0) return;
            final percent = (stats.getTime() / totalDuration.inMilliseconds)
                .clamp(0.0, 1.0);
            controller.add(
              ConversionProgress(percent: percent, elapsed: stopwatch.elapsed),
            );
          },
        );
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
}
