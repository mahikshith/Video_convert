import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';

abstract interface class SettingsRepository {
  Future<ConversionPreset> getDefaultPreset();
  Future<void> setDefaultPreset(ConversionPreset preset);

  Future<bool> hasSeenOnboarding();
  Future<void> markOnboardingSeen();
}
