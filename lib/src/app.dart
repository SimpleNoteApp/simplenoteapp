import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/utils/gorouter.util.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple Note App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(95, 60, 133, 32),
      ),
      routerConfig: router,
    );
  }
}
