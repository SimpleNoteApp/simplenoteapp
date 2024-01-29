import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

class NoteEditState with ChangeNotifier {
  NoteModel? note =
      NoteModel(title: "", content: "", createdAt: "", updatedAt: "");

  NoteEditState({this.note});

  void setTitle(String title) {
    note!.title = title;
    notifyListeners();
  }

  void setContent(String content) {
    note!.content = content;
    notifyListeners();
  }

  void setNote(NoteModel note) {
    this.note = note;
    notifyListeners();
  }

  void resetNote() {
    note = NoteModel(title: "", content: "", createdAt: "", updatedAt: "");
    notifyListeners();
  }
}
