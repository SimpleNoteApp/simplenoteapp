import 'package:flutter/material.dart';

/// [SettingsSection] is a widget that displays a section of settings.
///
/// It is a container that displays a title and a list of children.
///
/// The title is displayed at the top of the container and the children are
/// displayed below the title.
///
/// * [title]: A [String] that represents the title of the section.
/// * [children]: A [List<Widget>] that represents the list of children of the
/// section. But in this case, it is a list of [SettingsOption] widgets.
///
/// ```dart
/// SettingsSection(
///   title: 'Appearance',
///   children: <Widget>[
///   SettingsOption(
///     title: 'Dark theme',
///     trailing: Switch(
///     value: // replace with the value of the setting,
///     onChanged: (value) {
///       // replace with the function that changes the setting
///     },
///   ),
///   onTap: () {
///     // replace with the function that changes the setting
///   },
/// )
/// ```
class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  /// Creates a [SettingsSection] widget.
  ///
  /// * [key]: an identifier for the widget.
  /// * [title]: [String] that represents the title of the section.
  /// * [children]: a [List<Widget>] that represents the list of children of the
  /// section. But in this case, it is a list of [SettingsOption] widgets.
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.only(top: 16.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: children,
          ),
        ],
      ),
    );
  }
}
