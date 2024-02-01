import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/themes/dark.theme.dart';
import 'package:simplenoteapp/src/themes/light.theme.dart';

import 'package:simplenoteapp/src/utils/gorouter.util.dart';

class App extends StatelessWidget {
  const App({super.key});

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
