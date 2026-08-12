import 'package:flutter_test/flutter_test.dart';
import 'package:video_converter_pro/core/services/encoding_settings_resolver.dart';
import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';

void main() {
  const resolver = EncodingSettingsResolver();

  group('EncodingSettingsResolver', () {
    test('compression preset maps straight through to settings', () {
      final settings = resolver.resolve(
        const ConversionPreset.compression(CompressionPreset.medium),
        inputDuration: const Duration(seconds: 30),
      );

      expect(settings.maxWidth, CompressionPreset.medium.maxWidth);
      expect(settings.videoBitrateKbps, CompressionPreset.medium.videoBitrateKbps);
      expect(settings.crf, CompressionPreset.medium.crf);
    });

    test('destination preset with a fixed bitrate maps straight through', () {
      final settings = resolver.resolve(
        const ConversionPreset.destination(DestinationPreset.whatsapp),
        inputDuration: const Duration(seconds: 30),
      );

      expect(settings.videoBitrateKbps, DestinationPreset.whatsapp.videoBitrateKbps);
    });

    test('email preset computes bitrate from target size and duration', () {
      final settings = resolver.resolve(
        const ConversionPreset.destination(DestinationPreset.email),
        inputDuration: const Duration(seconds: 60),
      );

      // 25MB target over 60s, minus audio bitrate, should land well above
      // the floor and roughly in the low-thousands-of-kbps range.
      expect(settings.videoBitrateKbps, isNotNull);
      expect(settings.videoBitrateKbps! > 100, isTrue);
    });

    test('email preset bitrate never drops below the floor on long videos', () {
      final settings = resolver.resolve(
        const ConversionPreset.destination(DestinationPreset.email),
        inputDuration: const Duration(hours: 2),
      );

      expect(settings.videoBitrateKbps, 100);
    });
  });
}
