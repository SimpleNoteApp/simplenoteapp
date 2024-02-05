import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

/// [NoteEditController] is a controller for the [NoteEditView].
/// It provides an interface for manipulating the note being edited.
class NoteEditController {
  NoteModel note =
      NoteModel(title: "", content: "", createdAt: "", updatedAt: "");

  /// Constructor allows to start editing with an existing note.
  NoteEditController({NoteModel? note}) {
    if (note != null) {
      this.note = note;
    }
  }

  /// Updates the title of the note being edited.
  /// This method uses the [NoteEditorState] to update the title.
  void setTitle(BuildContext context, String title) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);

    noteEditorState.setTitle(title);
  }

  /// Updates the content of the note being edited.
  /// This method uses the [NoteEditorState] to update the content.
  void setContent(BuildContext context, String content) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);

    noteEditorState.setContent(content);
  }

  /// Replaces the note being edited with a new one.
  /// This method uses the [NoteEditorState] to replace the note.
  void setNote(BuildContext context, NoteModel note) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);

    noteEditorState.setNote(note);
  }

  /// Saves the note being edited to the [NoteRepository].
  /// If the note is new, it creates it, otherwise it updates the existing one.
  /// After saving, it resets the note in the [NoteEditorState].
  void savenote(BuildContext context) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);
    NoteRepository noteRepository = context.read<NoteRepository>();

    if (noteEditorState.note.title == "" ||
        noteEditorState.note.content == "") {
      throw Exception("Title and content cannot be empty");
    }

    if (noteEditorState.note.createdAt == "") {
      noteEditorState.note.createdAt = DateTime.now().toString();
      noteEditorState.note.updatedAt = DateTime.now().toString();
    }

    if (note.id == null) {
      noteRepository.create(noteEditorState.note);
    } else {
      noteRepository.update(noteEditorState.note);
    }

    noteEditorState.resetNote();
  }
}
