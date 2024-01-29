import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    title: const AddNewNoteButton(),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: SettingsButton(),
      ),
    ],
  );
}
