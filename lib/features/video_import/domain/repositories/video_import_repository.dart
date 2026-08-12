import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';

/// Throws a Failure subtype (see core/error/failure.dart) on error.
abstract interface class VideoImportRepository {
  Future<VideoFile> pickVideo();
}
