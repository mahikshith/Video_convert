import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_progress.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_request.dart';

/// Emits progress updates while converting; completes the stream on success
/// or adds a Failure (see core/error/failure.dart) as a stream error.
abstract interface class VideoConversionRepository {
  Stream<ConversionProgress> convert(ConversionRequest request);
}
