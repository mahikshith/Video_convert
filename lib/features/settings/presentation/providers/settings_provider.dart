import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/settings/data/datasources/settings_preferences_datasource.dart';
import 'package:video_converter_pro/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:video_converter_pro/features/settings/domain/repositories/settings_repository.dart';

part 'settings_provider.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  return const SettingsRepositoryImpl(SettingsPreferencesDataSource());
}

@riverpod
class DefaultPresetController extends _$DefaultPresetController {
  @override
  Future<ConversionPreset> build() {
    return ref.read(settingsRepositoryProvider).getDefaultPreset();
  }

  Future<void> setDefaultPreset(ConversionPreset preset) async {
    await ref.read(settingsRepositoryProvider).setDefaultPreset(preset);
    ref.invalidateSelf();
    await future;
  }
}
