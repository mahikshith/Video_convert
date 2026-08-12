import 'package:video_converter_pro/features/video_conversion/data/datasources/ffmpeg_datasource.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_progress.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_request.dart';
import 'package:video_converter_pro/features/video_conversion/domain/repositories/video_conversion_repository.dart';

class VideoConversionRepositoryImpl implements VideoConversionRepository {
  const VideoConversionRepositoryImpl(this._dataSource);

  final FfmpegDataSource _dataSource;

  @override
  Stream<ConversionProgress> convert(ConversionRequest request) {
    return _dataSource.convert(
      inputPath: request.input.path,
      outputPath: request.outputPath,
      outputFormat: request.outputFormat,
      preset: request.preset,
      gifOptions: request.gifOptions,
    );
  }

  @override
  Future<void> cancel() => _dataSource.cancel();
}
