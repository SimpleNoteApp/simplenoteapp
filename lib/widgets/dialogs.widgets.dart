import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutExitFromEditor extends StatelessWidget {
  const AboutExitFromEditor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure?"),
      content: Text("Do you want to discard this note?"),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text("No")),
        TextButton(
            onPressed: () {
              context.go("/");
              Navigator.pop(context);
            },
            child: Text("Yes")),
      ],
    );
  }
}
