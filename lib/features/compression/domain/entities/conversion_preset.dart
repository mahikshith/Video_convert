import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';

part 'conversion_preset.freezed.dart';

@freezed
sealed class ConversionPreset with _$ConversionPreset {
  const factory ConversionPreset.compression(CompressionPreset preset) =
      CompressionSelection;
  const factory ConversionPreset.destination(DestinationPreset preset) =
      DestinationSelection;
}
