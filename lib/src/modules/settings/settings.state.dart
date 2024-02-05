import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

/// [SettingsState] class is used to manage the state of the settings in the application.
/// It uses the `ChangeNotifier` mixin from the Flutter Foundation package to notify listeners when a change occurs.
class SettingsState with ChangeNotifier {
  /// [_setting] and [_isDarkTheme] are private variables that hold the current setting and theme state.
  String _setting = '';
  bool _isDarkTheme = false;

  /// [setting] and [isDarkTheme] are public getters that return the current setting and theme state.
  String get setting => _setting;
  bool get isDarkTheme => _isDarkTheme;

  /// [setting] and [isDarkTheme] are public setters that update the setting and theme state,
  /// save the new state to shared preferences, and notify all listeners of the change.
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

  /// The constructor of the [SettingsState] class.
  /// It loads the setting and theme state from shared preferences when a new instance of [SettingsState] is created.
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

  /// [saveSetting] is a method that saves a setting to shared preferences.
  /// It takes a key and a value as parameters.
  Future<void> saveSetting(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  /// [loadSetting] is a method that loads a setting from shared preferences.
  /// It takes a key as a parameter and returns a Future that completes with the value associated with the key.
  Future<String?> loadSetting(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
