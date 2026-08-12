import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferencesDataSource {
  const SettingsPreferencesDataSource();

  static const _defaultPresetKey = 'default_preset';

  Future<String?> getDefaultPresetKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_defaultPresetKey);
  }

  Future<void> setDefaultPresetKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_defaultPresetKey, key);
  }
}
