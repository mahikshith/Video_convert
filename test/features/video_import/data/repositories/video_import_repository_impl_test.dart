import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/features/video_import/data/datasources/video_picker_datasource.dart';
import 'package:video_converter_pro/features/video_import/data/repositories/video_import_repository_impl.dart';
import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';

class MockVideoPickerDataSource extends Mock implements VideoPickerDataSource {}

void main() {
  late MockVideoPickerDataSource dataSource;
  late VideoImportRepositoryImpl repository;

  setUp(() {
    dataSource = MockVideoPickerDataSource();
    repository = VideoImportRepositoryImpl(dataSource);
  });

  group('VideoImportRepositoryImpl', () {
    test('pickVideo returns the video from the data source', () async {
      const video = VideoFile(
        path: '/tmp/video.mp4',
        name: 'video.mp4',
        sizeBytes: 1024,
        extension: 'mp4',
      );
      when(() => dataSource.pickVideo()).thenAnswer((_) async => video);

      final result = await repository.pickVideo();

      expect(result, video);
    });

    test('pickVideo propagates NoVideoSelectedFailure', () async {
      when(() => dataSource.pickVideo())
          .thenThrow(const NoVideoSelectedFailure());

      expect(
        () => repository.pickVideo(),
        throwsA(isA<NoVideoSelectedFailure>()),
      );
    });
  });
}
