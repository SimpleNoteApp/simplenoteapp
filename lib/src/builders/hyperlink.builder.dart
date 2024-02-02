import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class LinkBuilder extends StatelessWidget {
  final String url;
  final String text;

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
