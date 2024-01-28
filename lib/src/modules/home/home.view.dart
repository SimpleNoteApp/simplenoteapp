import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/widgets/noteview.widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoteView(notes: controller.notes),
    );
  }
}
