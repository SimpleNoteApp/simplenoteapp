import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/builders/settings/settingsoption.builder.dart';
import 'package:simplenoteapp/src/builders/settings/settingssection.builder.dart';
import 'package:simplenoteapp/src/modules/settings/settings.controller.dart';
import 'package:simplenoteapp/src/widgets/dialogs.widgets.dart';

/// [DangerousZoneSection] is a stateless widget that provides a section in the settings for dangerous actions.
/// It uses a [SettingsContoller] to interact with the settings state.
class DangerousZoneSection extends StatelessWidget {
  final SettingsContoller controller;

  const DangerousZoneSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // The SettingsSection widget provides the UI for a section in the settings.
    // The SettingsOption widget provides the UI for an option in the settings.
    // The Icon widget provides the UI for an icon that can be displayed in the SettingsOption.
    // The onTap function shows a dialog about deleting all notes when the SettingsOption is tapped.
    return SettingsSection(
      title: 'Dangerous Zone',
      children: <Widget>[
        SettingsOption(
          title: 'Delete all notes',
          trailing: const Icon(Icons.delete),
          onTap: () {
            aboutDeleteAllNotes(context);
          },
        ),
      ],
    );
  }
}
