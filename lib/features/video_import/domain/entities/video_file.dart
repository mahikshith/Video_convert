import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_file.freezed.dart';

@freezed
class VideoFile with _$VideoFile {
  const factory VideoFile({
    required String path,
    required String name,
    required int sizeBytes,
    required String extension,
  }) = _VideoFile;
}
