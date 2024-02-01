import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState with ChangeNotifier {
  String _setting = '';
  bool _isDarkTheme = false;

  String get setting => _setting;
  bool get isDarkTheme => _isDarkTheme;

  set setting(String value) {
    _setting = value;
    saveSetting('setting', value);
    notifyListeners();
  }

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    saveSetting('isDarkTheme', value.toString());
    notifyListeners();
  }

  SettingsState() {
    loadSetting('setting').then((value) {
      _setting = value ?? '';
      notifyListeners();
    });

    loadSetting('isDarkTheme').then((value) {
      _isDarkTheme = value == 'true';
      notifyListeners();
    });
  }

  Future<void> saveSetting(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> loadSetting(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
