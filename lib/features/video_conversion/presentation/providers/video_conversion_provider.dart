import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_converter_pro/core/error/failure.dart';
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
  return const VideoConversionRepositoryImpl(FfmpegDataSource());
}

@riverpod
class VideoConversionController extends _$VideoConversionController {
  @override
  FutureOr<ConversionUiState> build() => const ConversionUiState.idle();

  Future<void> pickAndConvert() async {
    state = const AsyncData(ConversionUiState.idle());

    final VideoFile video;
    try {
      video = await ref.read(videoImportRepositoryProvider).pickVideo();
    } on NoVideoSelectedFailure {
      state = const AsyncData(ConversionUiState.idle());
      return;
    }

    state = await AsyncValue.guard(() async {
      final outputDir = await getTemporaryDirectory();
      final outputPath =
          '${outputDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.'
          '${OutputFormat.mp4.extension}';

      final request = ConversionRequest(
        input: video,
        outputFormat: OutputFormat.mp4,
        outputPath: outputPath,
      );

      final stopwatch = Stopwatch()..start();
      final repository = ref.read(videoConversionRepositoryProvider);
      await for (final progress in repository.convert(request)) {
        state = AsyncData(ConversionUiState.inProgress(progress));
      }
      stopwatch.stop();

      final outputFile = File(outputPath);
      final outputSizeBytes = await outputFile.length();

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
}
