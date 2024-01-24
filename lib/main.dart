import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/app.state.dart';
import 'package:simplenoteapp/utils/gorouter.util.dart';

void main() {
  runApp(SimpleNoteApp());
}

class SimpleNoteApp extends StatelessWidget {
  const SimpleNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        title: 'Simple Note App',
        theme: ThemeData(
          useMaterial3: true,
          // primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
