import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/builders/hyperlink.builder.dart';
import 'package:simplenoteapp/src/modules/settings/settings.controller.dart';
import 'package:simplenoteapp/src/modules/settings/settingssections/apperance.section.dart';
import 'package:simplenoteapp/src/modules/settings/settingssections/dangerous.section.dart';
import 'package:simplenoteapp/src/themes/dark.theme.dart';
import 'package:simplenoteapp/src/themes/light.theme.dart';

/// [SettingsView] is a stateless widget that represents the settings screen.
/// It uses a [FutureBuilder] to get the app version asynchronously from the [SettingsController].
/// It also uses a [ValueListenableBuilder] to listen for changes in the theme from the [SettingsController].
/// Depending on the theme, it applies either the [darkTheme] or [lightTheme].
/// It constructs a [SettingsWidgetLayout] with the necessary parameters including the screen width, [SettingsController], and app version.
class SettingsView extends StatelessWidget {
  final SettingsContoller controller;

  const SettingsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getAppVersion(),
        builder: (BuildContext context, AsyncSnapshot<String> appVersion) {
          return ValueListenableBuilder(
            valueListenable: controller.themeNotifier,
            builder: (context, bool isDarkTheme, _) {
              double width = MediaQuery.of(context).size.width;
              return Theme(
                data: isDarkTheme ? darkTheme : lightTheme,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Settings'),
                  ),
                  body: Center(
                    child: SettingsWidgetLayout(
                      width: width,
                      controller: controller,
                      appVersion: appVersion.data ?? "Unknown",
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}

/// [SettingsWidgetLayout] is a stateless widget that represents the layout of the settings screen.
/// It uses a [FractionallySizedBox] to adjust its size based on the screen width.
/// It includes two sections, [SettingsApperanceSection] and [DangerousZoneSection], which are defined in separate widgets.
/// The [SettingsApperanceSection] is responsible for the appearance settings, while the [DangerousZoneSection] is responsible for the dangerous settings.
/// At the bottom, it displays the app version and a hyperlink made by [LinkBuilder].
class SettingsWidgetLayout extends StatelessWidget {
  const SettingsWidgetLayout({
    super.key,
    required this.width,
    required this.controller,
    required this.appVersion,
  });

  final double width;
  final SettingsContoller controller;
  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width < 600 ? 0.9 : 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              SettingsApperanceSection(controller: controller),
              DangerousZoneSection(controller: controller),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('App version: $appVersion'),
                const LinkBuilder(
                    url: "https://denkisil.me", text: "Made by denkisil")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
