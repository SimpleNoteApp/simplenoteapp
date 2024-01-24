import 'package:flutter/material.dart';
import 'package:simplenoteapp/widgets/appbars.widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: settingsOpenedAppBar(context),
        body: Container(
            alignment: Alignment.center,
            child: const Center(child: Text("Settings page"))));
  }
}
