import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';
import 'package:video_converter_pro/features/settings/data/datasources/settings_preferences_datasource.dart';
import 'package:video_converter_pro/features/settings/data/repositories/settings_repository_impl.dart';

class MockSettingsPreferencesDataSource extends Mock
    implements SettingsPreferencesDataSource {}

void main() {
  late MockSettingsPreferencesDataSource dataSource;
  late SettingsRepositoryImpl repository;

  setUp(() {
    dataSource = MockSettingsPreferencesDataSource();
    repository = SettingsRepositoryImpl(dataSource);
  });

  group('SettingsRepositoryImpl', () {
    test('getDefaultPreset falls back to medium compression when unset', () async {
      when(() => dataSource.getDefaultPresetKey()).thenAnswer((_) async => null);

      final result = await repository.getDefaultPreset();

      expect(
        result,
        const ConversionPreset.compression(CompressionPreset.medium),
      );
    });

    test('getDefaultPreset decodes a stored compression preset', () async {
      when(() => dataSource.getDefaultPresetKey())
          .thenAnswer((_) async => 'compression:high');

      final result = await repository.getDefaultPreset();

      expect(
        result,
        const ConversionPreset.compression(CompressionPreset.high),
      );
    });

    test('getDefaultPreset decodes a stored destination preset', () async {
      when(() => dataSource.getDefaultPresetKey())
          .thenAnswer((_) async => 'destination:whatsapp');

      final result = await repository.getDefaultPreset();

      expect(
        result,
        const ConversionPreset.destination(DestinationPreset.whatsapp),
      );
    });

    test('getDefaultPreset falls back on garbage input', () async {
      when(() => dataSource.getDefaultPresetKey())
          .thenAnswer((_) async => 'not-a-valid-key');

      final result = await repository.getDefaultPreset();

      expect(
        result,
        const ConversionPreset.compression(CompressionPreset.medium),
      );
    });

    test('setDefaultPreset encodes a compression preset', () async {
      when(() => dataSource.setDefaultPresetKey(any()))
          .thenAnswer((_) async {});

      await repository
          .setDefaultPreset(const ConversionPreset.compression(CompressionPreset.small));

      verify(() => dataSource.setDefaultPresetKey('compression:small'))
          .called(1);
    });

    test('setDefaultPreset encodes a destination preset', () async {
      when(() => dataSource.setDefaultPresetKey(any()))
          .thenAnswer((_) async {});

      await repository.setDefaultPreset(
        const ConversionPreset.destination(DestinationPreset.youtube),
      );

      verify(() => dataSource.setDefaultPresetKey('destination:youtube'))
          .called(1);
    });
  });
}
