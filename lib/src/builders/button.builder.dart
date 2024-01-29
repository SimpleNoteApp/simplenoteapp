import 'package:flutter/material.dart';

class ButtonBuilder extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPressed;
  final String? label;
  final double width;
  final double height;
  final String? tooltip; // Add this line

  const ButtonBuilder({
    Key? key,
    this.icon,
    required this.onPressed,
    this.label,
    this.width = 50.0,
    this.height = 50.0,
    this.tooltip, // And this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '', // Use the tooltip here
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.zero, // Remove padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Make it square
            ),
            elevation: 0,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: Colors.white),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                      Text(label!, style: const TextStyle(color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
