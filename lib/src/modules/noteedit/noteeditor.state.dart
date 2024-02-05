import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/models/note.model.dart';

/// [NoteEditorState] is a state management class for the note editor.
/// It uses the [ChangeNotifier] mixin to notify listeners when the note being edited changes.
class NoteEditorState with ChangeNotifier {
  // The note being edited.
  NoteModel note;

  // Controllers for the title and content text fields.
  // These are used to update the UI when the note changes.
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  // Constructor allows to start editing with an existing note.
  // If no note is provided, it initializes with an empty note.
  NoteEditorState({NoteModel? note})
      : note = note ??
            NoteModel(title: "", content: "", createdAt: "", updatedAt: "");

  /// Updates the title of the note being edited.
  /// Also updates the [titleController] to keep the UI in sync.
  /// Notifies listeners after the update.
  void setTitle(String title) {
    note.title = title;

    if (titleController.text != title) {
      titleController.text = title;
    }

    notifyListeners();
  }

  /// Updates the content of the note being edited.
  /// Also updates the [contentController] to keep the UI in sync.
  /// Notifies listeners after the update.
  void setContent(String content) {
    note.content = content;

    if (contentController.text != content) {
      contentController.text = content;
    }

    notifyListeners();
  }

  /// Replaces the note being edited with a new one.
  /// Also updates the [titleController] and [contentController] to keep the UI in sync.
  /// Notifies listeners after the update.
  void setNote(NoteModel note) {
    this.note = note;
    titleController.text = note.title;
    contentController.text = note.content;
    notifyListeners();
  }

  /// Resets the note being edited to an empty note.
  /// Also clears the [titleController] and [contentController] to reset the UI.
  /// Notifies listeners after the reset.
  void resetNote() {
    note = NoteModel(title: "", content: "", createdAt: "", updatedAt: "");
    titleController.clear();
    contentController.clear();
    notifyListeners();
  }
}
