import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_result.freezed.dart';

@freezed
class ConversionResult with _$ConversionResult {
  const factory ConversionResult({
    required String outputPath,
    required int inputSizeBytes,
    required int outputSizeBytes,
    required Duration processingTime,
  }) = _ConversionResult;
}
