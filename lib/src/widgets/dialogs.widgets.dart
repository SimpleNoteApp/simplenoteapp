import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

// This function is used to show a dialog box with a given title, content and actions.
// It uses the showDialog function from Flutter to display an AlertDialog.
// The AlertDialog uses the dialogBackgroundColor from the current theme as its background color.
// The title and content of the AlertDialog are set to the title and content passed to the function.
// The actions of the AlertDialog are set to the actions passed to the function.
Future<dynamic> showDialogBox(
    BuildContext context, String title, String content, List<Widget> actions) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      title: Text(title),
      content: Text(content),
      actions: actions,
    ),
  );
}

// This function returns a 'Ok' button widget which pops the current route when pressed.
// It uses the TextButton widget from Flutter to create a button with the text 'Ok'.
// When the button is pressed, it calls the pop function of the context to close the dialog.
Widget okButton(BuildContext context) {
  return TextButton(
    child: const Text("Ok"),
    onPressed: () {
      context.pop();
    },
  );
}

// This function returns a 'Yes' button widget which executes the provided callback when pressed.
// It uses the TextButton widget from Flutter to create a button with the text 'Yes'.
// When the button is pressed, it calls the provided callback function.
Widget yesButton(BuildContext context, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: const Text("Yes"),
  );
}

// This function returns a 'No' button widget which pops the current route when pressed.
// It uses the TextButton widget from Flutter to create a button with the text 'No'.
// When the button is pressed, it calls the pop function of the context to close the dialog.
Widget noButton(BuildContext context) {
  return TextButton(
    child: const Text("No"),
    onPressed: () {
      context.pop();
    },
  );
}

// This function shows an error dialog with the provided reason.
// It uses the showDialogBox function to display a dialog with the title 'Error' and the provided reason as content.
// The dialog has a single 'Ok' button which closes the dialog when pressed.
void errorDialog(BuildContext context, String reason) {
  showDialogBox(
    context,
    "Error",
    reason,
    [okButton(context)],
  );
}

// This function shows a confirmation dialog for deleting all notes.
// It uses the showDialogBox function to display a dialog with the title 'Are you sure?' and a message asking for confirmation to delete all notes.
// The dialog has a 'Yes' button which deletes all notes from the NoteRepository when pressed and a 'No' button which simply closes the dialog.
// After deleting the notes, it shows a SnackBar with the message 'All notes deleted'.
Future<dynamic> aboutDeleteAllNotes(BuildContext context) {
  return showDialogBox(
    context,
    "Are you sure?",
    "You are about to delete all notes. Are you sure?",
    [
      yesButton(context, () {
        NoteRepository noteRepository = context.read<NoteRepository>();

        noteRepository.deleteAll();

        context.pop();
        context.pop();

        SnackBar snackBar = const SnackBar(
          content: Text("All notes deleted"),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }),
      noButton(context),
    ],
  );
}

// This function shows a confirmation dialog for exiting the editor without saving changes.
// It uses the showDialogBox function to display a dialog with the title 'Are you sure?' and a message asking for confirmation to leave without saving changes.
// The dialog has a 'Yes' button which simply closes the dialog and a 'No' button which also simply closes the dialog.
Future<dynamic> aboutExitFromEditorDialog(BuildContext context) {
  return showDialogBox(
    context,
    "Are you sure?",
    "You have unsaved changes. Are you sure you want to leave?",
    [
      yesButton(context, () {
        context.pop();
        context.pop();
      }),
      noButton(context),
    ],
  );
}

// This function shows a confirmation dialog for deleting a specific note.
// It uses the showDialogBox function to display a dialog with the title 'Are you sure?' and a message asking for confirmation to delete the note.
// The dialog has a 'Yes' button which deletes the note from the NoteRepository when pressed and a 'No' button which simply closes the dialog.
// After deleting the note, it shows a SnackBar with the message 'Note deleted' and an 'Undo' action which recreates the deleted note when pressed.
Future<dynamic> aboutDeleteNoteDialog(BuildContext context, NoteModel note) {
  return showDialogBox(
    context,
    "Are you sure?",
    "You are about to delete this note. Are you sure?",
    [
      yesButton(context, () {
        NoteRepository noteRepository = context.read<NoteRepository>();

        noteRepository.delete(note.id!);
        context.pop();

        if (context.canPop()) {
          context.pop();
        }

        SnackBar snackBar = SnackBar(
          content: const Text("Note deleted"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              noteRepository.create(note);
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }),
      noButton(context),
    ],
  );
}
