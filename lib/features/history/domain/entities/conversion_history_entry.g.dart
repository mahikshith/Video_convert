// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversionHistoryEntryImpl _$$ConversionHistoryEntryImplFromJson(
  Map<String, dynamic> json,
) => _$ConversionHistoryEntryImpl(
  id: json['id'] as String,
  inputFileName: json['inputFileName'] as String,
  outputPath: json['outputPath'] as String,
  outputExtension: json['outputExtension'] as String,
  inputSizeBytes: (json['inputSizeBytes'] as num).toInt(),
  outputSizeBytes: (json['outputSizeBytes'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$$ConversionHistoryEntryImplToJson(
  _$ConversionHistoryEntryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'inputFileName': instance.inputFileName,
  'outputPath': instance.outputPath,
  'outputExtension': instance.outputExtension,
  'inputSizeBytes': instance.inputSizeBytes,
  'outputSizeBytes': instance.outputSizeBytes,
  'timestamp': instance.timestamp.toIso8601String(),
};
