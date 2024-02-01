import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

class NoteEditorState with ChangeNotifier {
  NoteModel note;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  NoteEditorState({NoteModel? note})
      : note = note ??
            NoteModel(title: "", content: "", createdAt: "", updatedAt: "");

  void setTitle(String title) {
    note.title = title;

    if (titleController.text != title) {
      titleController.text = title;
    }

    notifyListeners();
  }

  void setContent(String content) {
    note.content = content;

    if (contentController.text != content) {
      contentController.text = content;
    }

    notifyListeners();
  }

  void setNote(NoteModel note) {
    this.note = note;
    titleController.text = note.title;
    contentController.text = note.content;
    notifyListeners();
  }

  void resetNote() {
    note = NoteModel(title: "", content: "", createdAt: "", updatedAt: "");
    titleController.clear();
    contentController.clear();
    notifyListeners();
  }
}
