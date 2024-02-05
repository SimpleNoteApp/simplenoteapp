import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/widgets/dialogs.widgets.dart';
import 'package:simplenoteapp/src/builders/button.builder.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

// This widget represents a button for adding a new note.
// When pressed, it navigates to the "/note/new" route.
class AddNewNoteButton extends StatelessWidget {
  const AddNewNoteButton({super.key});

  void _handlePress(BuildContext context) {
    context.push("/note/new");
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ButtonBuilder(
          key: key,
          tooltip: "Add New note",
          icon: Icons.add,
          onPressed: () => _handlePress(context),
          label: constraints.maxWidth > 600 ? "New note" : null,
          width: constraints.maxWidth > 600 ? 150 : 50,
          height: constraints.maxWidth > 600 ? 40 : 50,
        );
      },
    );
  }
}

// This widget represents a button for navigating to the settings.
// When pressed, it navigates to the "/settings" route.
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  void _handlePress(BuildContext context) {
    context.push("/settings");
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      key: key,
      tooltip: "Settings",
      icon: Icons.settings,
      onPressed: () => _handlePress(context),
    );
  }
}

// This widget represents a button for editing a note.
// When pressed, it navigates to the "/note/{note.id}/edit" route.
class EditNoteButton extends StatelessWidget {
  final NoteModel note;
  const EditNoteButton({super.key, required this.note});

  void _handlePress(BuildContext context) {
    context.push("/note/${note.id}/edit");
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      key: key,
      tooltip: "Edit note",
      icon: Icons.edit,
      onPressed: () => _handlePress(context),
    );
  }
}

// This widget represents a button for deleting a note.
// When pressed, it shows a dialog asking for confirmation to delete the note.
class DeleteNoteButton extends StatelessWidget {
  final NoteModel note;
  const DeleteNoteButton({super.key, required this.note});

  void _handlePress(BuildContext context) {
    aboutDeleteNoteDialog(context, note);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      key: key,
      tooltip: "Delete note",
      icon: Icons.delete,
      onPressed: () => _handlePress(context),
    );
  }
}

// This widget represents a button for saving a note.
// When pressed, it tries to save the note using the NoteEditController.
// If the note is saved successfully, it shows a SnackBar with the message "Note saved".
// If an error occurs while saving the note, it shows an error dialog with the error message.
class SaveNoteButton extends StatelessWidget {
  final NoteEditController controller;
  const SaveNoteButton({super.key, required this.controller});

  void _handlePress(BuildContext context) {
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
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return ButtonBuilder(
      key: key,
      tooltip: "Save note",
      icon: Icons.save,
      onPressed: () => _handlePress(context),
      label: isWide ? 'Save' : null,
      width: isWide ? 150 : 50,
      height: isWide ? 40 : 50,
    );
  }
}
