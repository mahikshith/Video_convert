import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_progress.freezed.dart';

@freezed
class ConversionProgress with _$ConversionProgress {
  const factory ConversionProgress({
    /// 0.0 to 1.0
    required double percent,
    required Duration elapsed,
  }) = _ConversionProgress;
}
