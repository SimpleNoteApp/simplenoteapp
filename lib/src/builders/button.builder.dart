import 'package:flutter/material.dart';

class ButtonBuilder extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPressed;
  final String? label;
  final double width;
  final double height;
  final String? tooltip;
  final Color? color;

  const ButtonBuilder({
    super.key,
    this.icon,
    required this.onPressed,
    this.label,
    this.width = 50.0,
    this.height = 50.0,
    this.tooltip,
    this.color,
  }) : assert(icon != null || label != null,
            'You must provide an icon or a label.');

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(label!, style: const TextStyle()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
