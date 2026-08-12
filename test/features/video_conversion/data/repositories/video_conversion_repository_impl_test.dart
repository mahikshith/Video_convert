import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_converter_pro/features/video_conversion/data/datasources/ffmpeg_datasource.dart';
import 'package:video_converter_pro/features/video_conversion/data/repositories/video_conversion_repository_impl.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_progress.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_request.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';
import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';

class MockFfmpegDataSource extends Mock implements FfmpegDataSource {}

void main() {
  late MockFfmpegDataSource dataSource;
  late VideoConversionRepositoryImpl repository;

  const video = VideoFile(
    path: '/tmp/input.mov',
    name: 'input.mov',
    sizeBytes: 2048,
    extension: 'mov',
  );

  const request = ConversionRequest(
    input: video,
    outputFormat: OutputFormat.mp4,
    outputPath: '/tmp/output.mp4',
  );

  setUp(() {
    dataSource = MockFfmpegDataSource();
    repository = VideoConversionRepositoryImpl(dataSource);
  });

  group('VideoConversionRepositoryImpl', () {
    test('convert forwards the request paths to the data source', () async {
      when(
        () => dataSource.convert(
          inputPath: video.path,
          outputPath: request.outputPath,
        ),
      ).thenAnswer(
        (_) => Stream.fromIterable([
          const ConversionProgress(percent: 1.0, elapsed: Duration.zero),
        ]),
      );

      final progressEvents = await repository.convert(request).toList();

      expect(progressEvents, hasLength(1));
      expect(progressEvents.single.percent, 1.0);
      verify(
        () => dataSource.convert(
          inputPath: video.path,
          outputPath: request.outputPath,
        ),
      ).called(1);
    });
  });
}
