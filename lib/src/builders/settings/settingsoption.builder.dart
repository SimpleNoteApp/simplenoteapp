import 'package:flutter/material.dart';

/// A widget that represents a settings option.
///
/// This widget is used to represent a setting option in the settings page.
///
/// This widget is used by the [SettingsSection] widget.
///
/// * [title]: The title of the setting option.
/// * [trailing]: The widget that is displayed at the end of the setting option.
/// * [onTap]: The function that is called when the setting option is tapped.
///
/// ```dart
/// SettingsOption(
///   title: 'Dark theme',
///   trailing: Switch(
///   value: true, // replace with the value of the setting
///   onChanged: (value) {
///     // replace with the function to change the setting
///   },
/// ),
/// ```
class SettingsOption extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  /// Creates a [SettingsOption] widget.
  ///
  /// * [key]: A unique identifier for the widget.
  /// * [title]: The title of the setting option.
  /// * [trailing]: The widget that is displayed at the end of the setting option.
  /// * [onTap]: The function that is called when the setting option is tapped.
  const SettingsOption({
    super.key,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            trailing
          ],
        ),
      ),
    );
  }
}
