import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/utils/packageinfo.util.dart';

class SettingsContoller {
  void setTheme(BuildContext context, bool isDarkTheme) {
    SettingsState settingsState = context.read<SettingsState>();

    settingsState.isDarkTheme = isDarkTheme;
  }

  bool getTheme(BuildContext context) {
    SettingsState settingsState = context.watch<SettingsState>();

    return settingsState.isDarkTheme;
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await returnPackageInfo();

    return "${packageInfo.version}-${packageInfo.buildNumber}";
  }
}
