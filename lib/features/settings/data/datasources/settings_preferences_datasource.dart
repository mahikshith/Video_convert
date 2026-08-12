import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferencesDataSource {
  const SettingsPreferencesDataSource();

  static const _defaultPresetKey = 'default_preset';
  static const _hasSeenOnboardingKey = 'has_seen_onboarding';

  Future<String?> getDefaultPresetKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_defaultPresetKey);
  }

  Future<void> setDefaultPresetKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_defaultPresetKey, key);
  }

  Future<bool> getHasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSeenOnboardingKey) ?? false;
  }

  Future<void> setHasSeenOnboarding(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenOnboardingKey, value);
  }
}
