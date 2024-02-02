import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/builders/hyperlink.builder.dart';
import 'package:simplenoteapp/src/builders/settings/settingsoption.builder.dart';
import 'package:simplenoteapp/src/builders/settings/settingssection.builder.dart';
import 'package:simplenoteapp/src/modules/settings/settings.controller.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/widgets/dialogs.widgets.dart';

class SettingsView extends StatelessWidget {
  final SettingsContoller controller;

  const SettingsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getAppVersion(),
        builder: (BuildContext context, AsyncSnapshot<String> appVersion) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Settings'),
              ),
              body: Column(
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
                      child: Center(
                        child: Column(
                          children: [
                            Text('App version: ${appVersion.data}'),
                            const LinkBuilder(
                                url: "https://denkisil.me",
                                text: "Made by denkisil")
                          ],
                        ),
                      )),
                ],
              ));
        });
  }
}

class SettingsApperanceSection extends StatelessWidget {
  final SettingsContoller controller;

  const SettingsApperanceSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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

class DangerousZoneSection extends StatelessWidget {
  final SettingsContoller controller;

  const DangerousZoneSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
