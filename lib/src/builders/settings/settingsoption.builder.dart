import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  const SettingsOption({
    Key? key,
    required this.title,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.0, // Set the height to a fixed value
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Text(title),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
