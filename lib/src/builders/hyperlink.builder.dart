import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

/// A [StatelessWidget] that builds a hyperlink.
///
/// This widget is used to build a hyperlink that can be clicked to open a URL.
/// [LinkBuilder] requires a [url] and a [text] to be provided.
///
/// * [url]: Specifies the URL to be opened when the hyperlink is clicked.
/// * [text]: Specifies the text to be displayed as the hyperlink.
///
/// Example:
///
/// ```dart
/// LinkBuilder(
///  url: "https://www.example.com",
///  text: "Example",
/// );
/// ```
class LinkBuilder extends StatelessWidget {
  final String url;
  final String text;

  /// Creates a [LinkBuilder] widget.
  ///
  /// * [key]: A unique identifier for the widget.
  /// * [url]: Specifies the URL to be opened when the hyperlink is clicked.
  /// * [text]: Specifies the text to be displayed as the hyperlink.
  const LinkBuilder({
    super.key,
    required this.url,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      builder: (context, followLink) {
        return InkWell(
          onTap: followLink,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.deepOrange,
            ),
          ),
        );
      },
    );
  }
}
