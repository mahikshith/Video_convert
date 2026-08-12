import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';
import 'package:video_converter_pro/features/settings/data/datasources/settings_preferences_datasource.dart';
import 'package:video_converter_pro/features/settings/domain/repositories/settings_repository.dart';

const _defaultPreset = ConversionPreset.compression(CompressionPreset.medium);

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl(this._dataSource);

  final SettingsPreferencesDataSource _dataSource;

  @override
  Future<ConversionPreset> getDefaultPreset() async {
    final raw = await _dataSource.getDefaultPresetKey();
    if (raw == null) return _defaultPreset;

    final parts = raw.split(':');
    if (parts.length != 2) return _defaultPreset;
    final type = parts[0];
    final name = parts[1];

    if (type == 'compression') {
      for (final preset in CompressionPreset.values) {
        if (preset.name == name) return ConversionPreset.compression(preset);
      }
    } else if (type == 'destination') {
      for (final preset in DestinationPreset.values) {
        if (preset.name == name) return ConversionPreset.destination(preset);
      }
    }
    return _defaultPreset;
  }

  @override
  Future<void> setDefaultPreset(ConversionPreset preset) {
    final key = switch (preset) {
      CompressionSelection(:final preset) => 'compression:${preset.name}',
      DestinationSelection(:final preset) => 'destination:${preset.name}',
    };
    return _dataSource.setDefaultPresetKey(key);
  }

  @override
  Future<bool> hasSeenOnboarding() => _dataSource.getHasSeenOnboarding();

  @override
  Future<void> markOnboardingSeen() =>
      _dataSource.setHasSeenOnboarding(true);
}
