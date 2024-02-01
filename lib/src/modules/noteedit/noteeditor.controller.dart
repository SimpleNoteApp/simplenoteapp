import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

class NoteEditController {
  NoteModel note =
      NoteModel(title: "", content: "", createdAt: "", updatedAt: "");

  NoteEditController({NoteModel? note}) {
    if (note != null) {
      this.note = note;
    }
  }

  void setTitle(BuildContext context, String title) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);

    noteEditorState.setTitle(title);
  }

  void setContent(BuildContext context, String content) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);

    noteEditorState.setContent(content);
  }

  void setNote(BuildContext context, NoteModel note) {
    NoteEditorState noteEditorState =
        Provider.of<NoteEditorState>(context, listen: false);

    noteEditorState.setNote(note);
  }

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
