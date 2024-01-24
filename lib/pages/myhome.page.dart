import 'package:flutter/material.dart';
import 'package:simplenoteapp/pages/welcome.page.dart';
import 'package:simplenoteapp/widgets/appbars.widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: WelcomePage(),
    );
  }
}
