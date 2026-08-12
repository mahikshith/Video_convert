import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversion_history_entry.freezed.dart';
part 'conversion_history_entry.g.dart';

@freezed
class ConversionHistoryEntry with _$ConversionHistoryEntry {
  const factory ConversionHistoryEntry({
    required String id,
    required String inputFileName,
    required String outputPath,
    required String outputExtension,
    required int inputSizeBytes,
    required int outputSizeBytes,
    required DateTime timestamp,
  }) = _ConversionHistoryEntry;

  factory ConversionHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$ConversionHistoryEntryFromJson(json);
}
