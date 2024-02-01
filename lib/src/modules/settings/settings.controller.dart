import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';

class SettingsContoller {
  void setTheme(BuildContext context, bool isDarkTheme) {
    SettingsState settingsState = context.read<SettingsState>();

    settingsState.isDarkTheme = isDarkTheme;
  }

  bool getTheme(BuildContext context) {
    SettingsState settingsState = context.watch<SettingsState>();

    return settingsState.isDarkTheme;
  }
}
