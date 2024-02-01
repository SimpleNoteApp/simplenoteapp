import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/src/builders/button.builder.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/widgets/dialogs.widgets.dart';

class AddNewNoteButton extends StatelessWidget {
  const AddNewNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ButtonBuilder(
          tooltip: "Add New note",
          icon: Icons.add,
          onPressed: () {
            context.push("/note/new");
          },
          label: constraints.maxWidth > 600 ? "New note" : null,
          width: constraints.maxWidth > 600 ? 150 : 50,
          height: constraints.maxWidth > 600 ? 40 : 50,
        );
      },
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      tooltip: "Settings",
      icon: Icons.settings,
      onPressed: () {
        context.push("/settings");
      },
    );
  }
}

class EditNoteButton extends StatelessWidget {
  final NoteModel note;
  const EditNoteButton({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      tooltip: "Edit note",
      icon: Icons.edit,
      onPressed: () {
        context.push("/note/${note.id}/edit");
      },
    );
  }
}

class DeleteNoteButton extends StatelessWidget {
  final NoteModel note;
  const DeleteNoteButton({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      tooltip: "Delete note",
      icon: Icons.delete,
      onPressed: () {
        aboutDeleteNoteDialog(context, note);
      },
    );
  }
}

class SaveNoteButton extends StatelessWidget {
  final NoteEditController controller;
  const SaveNoteButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return ButtonBuilder(
      tooltip: "Save note",
      icon: Icons.save,
      onPressed: () {
        try {
          controller.savenote(context);
          context.pop(context);
          SnackBar snackBar = const SnackBar(
            content: Text("Note saved"),
            duration: Duration(seconds: 2),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } on Exception catch (e) {
          errorDialog(context, e.toString());
        }
      },
      label: isWide ? 'Save' : null,
      width: isWide ? 150 : 50,
      height: isWide ? 40 : 50,
    );
  }
}
