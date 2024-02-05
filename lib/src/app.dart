import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/themes/dark.theme.dart';
import 'package:simplenoteapp/src/themes/light.theme.dart';

import 'package:simplenoteapp/src/utils/gorouter.util.dart';

/// [App] is the main entry point for the application.
///
/// It sets up the [MaterialApp] and the [GoRouter], and uses the [SettingsState] to determine the theme mode.
class App extends StatelessWidget {
  const App({super.key});

  /// Builds the [MaterialApp] and the [GoRouter].
  ///
  /// The theme mode is determined by the [SettingsState]. If `isDarkTheme` is true, the theme mode is set to `ThemeMode.dark`. Otherwise, it is set to `ThemeMode.light`.
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = context.select<SettingsState, ThemeMode>(
      (settingsState) =>
          settingsState.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );

    return MaterialApp.router(
      title: 'Simple Note App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
