import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/builders/settings/settingssection.builder.dart';
import 'package:simplenoteapp/src/builders/settings/settingsoption.builder.dart';
import 'package:simplenoteapp/src/modules/settings/settings.controller.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';

/// [SettingsApperanceSection] is a stateless widget that provides a section in the settings for changing the app's appearance.
/// It uses a [SettingsContoller] to interact with the settings state.
class SettingsApperanceSection extends StatelessWidget {
  final SettingsContoller controller;

  const SettingsApperanceSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // The SettingsSection widget provides the UI for a section in the settings.
    // The SettingsOption widget provides the UI for an option in the settings.
    // The Switch widget provides the UI for a switch that can be toggled on or off.
    // The onTap function changes the theme when the SettingsOption is tapped.
    return SettingsSection(
      title: 'Appearance',
      children: <Widget>[
        SettingsOption(
          title: 'Dark theme',
          trailing: Switch(
            value: controller.getTheme(context),
            onChanged: (value) {
              controller.setTheme(context, value);
            },
          ),
          onTap: () {
            bool changedTheme =
                !Provider.of<SettingsState>(context, listen: false).isDarkTheme;
            controller.setTheme(context, changedTheme);
          },
        ),
      ],
    );
  }
}
