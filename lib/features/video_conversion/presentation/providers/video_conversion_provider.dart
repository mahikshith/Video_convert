import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/core/services/logger_service.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/gif_creation/domain/entities/gif_options.dart';
import 'package:video_converter_pro/features/history/domain/entities/conversion_history_entry.dart';
import 'package:video_converter_pro/features/history/presentation/providers/history_provider.dart';
import 'package:video_converter_pro/features/video_conversion/data/datasources/ffmpeg_datasource.dart';
import 'package:video_converter_pro/features/video_conversion/data/repositories/video_conversion_repository_impl.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_request.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_result.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';
import 'package:video_converter_pro/features/video_conversion/domain/repositories/video_conversion_repository.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_import/data/datasources/video_picker_datasource.dart';
import 'package:video_converter_pro/features/video_import/data/repositories/video_import_repository_impl.dart';
import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';
import 'package:video_converter_pro/features/video_import/domain/repositories/video_import_repository.dart';

part 'video_conversion_provider.g.dart';

@riverpod
VideoImportRepository videoImportRepository(Ref ref) {
  return const VideoImportRepositoryImpl(VideoPickerDataSource());
}

@riverpod
VideoConversionRepository videoConversionRepository(Ref ref) {
  return VideoConversionRepositoryImpl(FfmpegDataSource());
}

@riverpod
class VideoConversionController extends _$VideoConversionController {
  VideoFile? _selectedVideo;

  @override
  FutureOr<ConversionUiState> build() => const ConversionUiState.idle();

  Future<void> pickVideo() async {
    try {
      final video = await ref.read(videoImportRepositoryProvider).pickVideo();
      _selectedVideo = video;
      state = AsyncData(ConversionUiState.selectingPreset(video));
    } on NoVideoSelectedFailure {
      // User backed out of the picker; stay on the current screen.
    } catch (e, st) {
      state = AsyncError(e is Failure ? e : ConversionFailure('$e'), st);
    }
  }

  Future<void> startConversion({
    required OutputFormat outputFormat,
    ConversionPreset? preset,
    GifOptions? gifOptions,
  }) async {
    final video = _selectedVideo;
    if (video == null) return;

    state = await AsyncValue.guard(() async {
      final outputDir = await getTemporaryDirectory();
      final outputPath =
          '${outputDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.'
          '${outputFormat.extension}';

      final request = ConversionRequest(
        input: video,
        outputFormat: outputFormat,
        outputPath: outputPath,
        preset: preset,
        gifOptions: gifOptions,
      );

      final stopwatch = Stopwatch()..start();
      final repository = ref.read(videoConversionRepositoryProvider);
      await for (final progress in repository.convert(request)) {
        state = AsyncData(ConversionUiState.inProgress(progress));
      }
      stopwatch.stop();

      final outputFile = File(outputPath);
      final outputSizeBytes = await outputFile.length();

      final now = DateTime.now();
      try {
        await ref.read(historyControllerProvider.notifier).add(
              ConversionHistoryEntry(
                id: now.microsecondsSinceEpoch.toString(),
                inputFileName: video.name,
                outputPath: outputPath,
                outputExtension: outputFormat.extension,
                inputSizeBytes: video.sizeBytes,
                outputSizeBytes: outputSizeBytes,
                timestamp: now,
              ),
            );
      } catch (e, st) {
        // A completed conversion shouldn't fail just because history
        // logging did; the user still gets their converted file.
        LoggerService.error('Failed to save history entry', error: e, stackTrace: st);
      }

      return ConversionUiState.completed(
        ConversionResult(
          outputPath: outputPath,
          inputSizeBytes: video.sizeBytes,
          outputSizeBytes: outputSizeBytes,
          processingTime: stopwatch.elapsed,
        ),
      );
    });
  }

  Future<void> cancel() async {
    await ref.read(videoConversionRepositoryProvider).cancel();
  }

  void reset() {
    _selectedVideo = null;
    state = const AsyncData(ConversionUiState.idle());
  }
}
