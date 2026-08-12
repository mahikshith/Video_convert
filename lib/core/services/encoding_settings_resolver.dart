import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/encoding_settings.dart';

/// Minimum video bitrate floor so size-targeted presets (e.g. Email) never
/// collapse to an unusable near-zero bitrate on very long inputs.
const _minVideoBitrateKbps = 100;

class EncodingSettingsResolver {
  const EncodingSettingsResolver();

  EncodingSettings resolve(
    ConversionPreset preset, {
    required Duration inputDuration,
  }) {
    return switch (preset) {
      CompressionSelection(:final preset) => EncodingSettings(
          maxWidth: preset.maxWidth,
          maxHeight: preset.maxHeight,
          videoBitrateKbps: preset.videoBitrateKbps,
          audioBitrateKbps: preset.audioBitrateKbps,
          crf: preset.crf,
        ),
      DestinationSelection(:final preset) => EncodingSettings(
          maxWidth: preset.maxWidth,
          maxHeight: preset.maxHeight,
          videoBitrateKbps: preset.videoBitrateKbps ??
              _bitrateForTargetSize(
                targetBytes: preset.targetMaxSizeBytes!,
                duration: inputDuration,
                audioBitrateKbps: preset.audioBitrateKbps,
              ),
          audioBitrateKbps: preset.audioBitrateKbps,
        ),
    };
  }

  int _bitrateForTargetSize({
    required int targetBytes,
    required Duration duration,
    required int audioBitrateKbps,
  }) {
    final durationSeconds = duration.inSeconds.clamp(1, double.maxFinite.toInt());
    final totalKbps = (targetBytes * 8 / 1000) / durationSeconds;
    final videoKbps = totalKbps - audioBitrateKbps;
    return videoKbps > _minVideoBitrateKbps
        ? videoKbps.round()
        : _minVideoBitrateKbps;
  }
}
