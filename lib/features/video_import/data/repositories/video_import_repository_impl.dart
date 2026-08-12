import 'package:video_converter_pro/features/video_import/data/datasources/video_picker_datasource.dart';
import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';
import 'package:video_converter_pro/features/video_import/domain/repositories/video_import_repository.dart';

class VideoImportRepositoryImpl implements VideoImportRepository {
  const VideoImportRepositoryImpl(this._dataSource);

  final VideoPickerDataSource _dataSource;

  @override
  Future<VideoFile> pickVideo() => _dataSource.pickVideo();
}
