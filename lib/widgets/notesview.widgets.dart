import 'package:flutter/material.dart';
import 'package:simplenoteapp/types/notate.type.dart';
import 'package:simplenoteapp/widgets/notecard.widgets.dart';

class NotationView extends StatelessWidget {
  final List<Notate>? notates;

  NotationView({super.key, this.notates});

  @override
  Widget build(context) {
    return ListView(
      children: [
        for (var notate in notates!)
          Align(
              child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: NotationCard(notate: notate))),
      ],
    );
  }
}
