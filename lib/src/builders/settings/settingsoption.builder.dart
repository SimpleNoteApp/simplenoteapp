import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  const SettingsOption({
    super.key,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.975,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60.0,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Add this
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
      ),
    );
  }
}
