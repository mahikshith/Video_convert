import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';
import 'package:video_converter_pro/features/video_import/domain/entities/video_file.dart';

part 'conversion_request.freezed.dart';

@freezed
class ConversionRequest with _$ConversionRequest {
  const factory ConversionRequest({
    required VideoFile input,
    required OutputFormat outputFormat,
    required String outputPath,
  }) = _ConversionRequest;
}
