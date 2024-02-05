import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/utils/packageinfo.util.dart';

/// The [SettingsContoller] class is used to interact with the settings state.
class SettingsContoller {
  /// [themeNotifier] is a notifier used to track theme changes.
  ValueNotifier<bool> themeNotifier;

  /// The [SettingsContoller] constructor initializes [themeNotifier] with the current [isDarkTheme] value in [SettingsState].
  SettingsContoller(BuildContext context)
      : themeNotifier = ValueNotifier<bool>(false) {
    SettingsState settingsState = context.read<SettingsState>();
    themeNotifier = ValueNotifier<bool>(settingsState.isDarkTheme);
  }

  /// The [setTheme] method changes the app's theme.
  /// It takes a context and a boolean indicating whether the theme should be dark.
  /// This method changes the [isDarkTheme] value in [SettingsState] and updates the [themeNotifier].
  void setTheme(BuildContext context, bool isDarkTheme) {
    SettingsState settingsState = context.read<SettingsState>();

    settingsState.isDarkTheme = isDarkTheme;
    themeNotifier.value = isDarkTheme;
  }

  /// The [getTheme] method returns the current theme of the app.
  /// It takes a context and returns a boolean indicating whether the current theme is dark.
  bool getTheme(BuildContext context) {
    SettingsState settingsState = context.watch<SettingsState>();

    return settingsState.isDarkTheme;
  }

  /// The [getAppVersion] method returns the app's version.
  /// This method uses [returnPackageInfo] to get package information,
  /// then returns a string containing the package's version and build number.
  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await returnPackageInfo();

    return "${packageInfo.version}-${packageInfo.buildNumber}";
  }
}
