import 'package:file_picker/file_picker.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';

class VideoPickerDataSource {
  const VideoPickerDataSource();

  Future<VideoFile> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result == null || result.files.isEmpty) {
      throw const NoVideoSelectedFailure();
    }

    final picked = result.files.single;
    final path = picked.path;
    if (path == null) {
      throw const FileSystemFailure('Selected file has no accessible path.');
    }

    return VideoFile(
      path: path,
      name: picked.name,
      sizeBytes: picked.size,
      extension: picked.extension ?? '',
    );
  }
}
