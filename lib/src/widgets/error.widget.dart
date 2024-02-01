import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;

  const ErrorWidget(this.details, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AlertDialog(
          title: const Text('Error'),
          content: Text('An error occurred: ${details.exception}'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
