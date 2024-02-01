import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/app.state.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

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

void errorDialog(BuildContext context, String reason) {
  showDialogBox(
    context,
    "Error",
    reason,
    [
      TextButton(
        child: const Text("Ok"),
        onPressed: () {
          context.pop();
        },
      ),
    ],
  );
}

Future<dynamic> aboutDeleteAllNotes(BuildContext context) {
  return showDialogBox(
    context,
    "Are you sure?",
    "You are about to delete all notes. Are you sure?",
    [
      TextButton(
        child: const Text("Yes"),
        onPressed: () {
          NoteRepository noteRepository = context.read<NoteRepository>();

          noteRepository.deleteAll();

          context.pop();
          context.pop();

          SnackBar snackBar = const SnackBar(
            content: Text("All notes deleted"),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
      TextButton(
        child: const Text("No"),
        onPressed: () {
          context.pop();
        },
      ),
    ],
  );
}

Future<dynamic> aboutExitFromEditorDialog(BuildContext context) {
  return showDialogBox(
    context,
    "Are you sure?",
    "You have unsaved changes. Are you sure you want to leave?",
    [
      TextButton(
        child: const Text("Yes"),
        onPressed: () {
          context.pop();
          context.pop();
        },
      ),
      TextButton(
        child: const Text("No"),
        onPressed: () {
          context.pop();
        },
      ),
    ],
  );
}

Future<dynamic> aboutDeleteNoteDialog(BuildContext context, NoteModel note) {
  return showDialogBox(
    context,
    "Are you sure?",
    "You are about to delete this note. Are you sure?",
    [
      TextButton(
        child: const Text("Yes"),
        onPressed: () {
          NoteRepository noteRepository =
              context.read<AppState>().getNoteRepo(context);

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
        },
      ),
      TextButton(
        child: const Text("No"),
        onPressed: () {
          context.pop();
        },
      ),
    ],
  );
}
