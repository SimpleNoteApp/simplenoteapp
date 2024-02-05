import 'package:flutter/material.dart';

/// A builder for creating buttons with icons and labels.
///
/// The [ButtonBuilder] requires either an [icon] or a [label] to be provided.
///
/// * [icon]: Specifies the icon to be displayed on the button.
/// * [onPressed]: Specifies the callback to be called when the button is pressed.
/// * [label]: Specifies the text to be displayed on the button.
/// * [width]: Specifies the width of the button.
/// * [height]: Specifies the height of the button.
/// * [tooltip]: Specifies the message to be displayed when the button is hovered.
/// * [color]: Specifies the color of the button.
///
/// Example:
/// ```dart
/// ButtonBuilder(
///  icon: Icons.add,
///  onPressed: () {
///    context.push("/note/new");
///  },
///  // constrains because in the LayoutBuilder
///  label: constraints.maxWidth > 600 ? "New note" : null,
///  width: constraints.maxWidth > 600 ? 150 : 50,
///  height: constraints.maxWidth > 600 ? 40 : 50,
/// );
/// ```
class ButtonBuilder extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onPressed;
  final String? label;
  final double width;
  final double height;
  final String? tooltip;
  final Color? color;

  /// Creates a [ButtonBuilder] widget.
  ///
  /// * [key]: A unique identifier for the widget.
  /// * [icon]: Specifies the icon to be displayed on the button.
  /// * [onPressed]: Specifies the callback to be called when the button is pressed.
  /// * [label]: Specifies the text to be displayed on the button.
  /// * [width]: Specifies the width of the button.
  /// * [height]: Specifies the height of the button.
  /// * [tooltip]: Specifies the message to be displayed when the button is hovered.
  /// * [color]: Specifies the color of the button.
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
