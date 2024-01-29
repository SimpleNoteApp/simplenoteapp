import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/src/builders/button.builder.dart';

class AddNewNoteButton extends StatelessWidget {
  const AddNewNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return ButtonBuilder(
            tooltip: "Add New note",
            icon: Icons.add,
            onPressed: () {
              context.go("/note/new");
            },
            label: "New note",
            width: 150,
            height: 40,
          );
        } else {
          return ButtonBuilder(
            tooltip: "Add New note",
            icon: Icons.add,
            onPressed: () {
              context.go("/note/new");
            },
          );
        }
      },
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      tooltip: "Settings",
      icon: Icons.settings,
      onPressed: () {},
    );
  }
}

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      tooltip: "Edit note",
      icon: Icons.edit,
      onPressed: () {},
    );
  }
}
