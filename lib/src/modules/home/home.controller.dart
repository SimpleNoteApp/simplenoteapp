import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/app.state.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

class HomeController {
  List<NoteModel> notes = [
    NoteModel(
      id: 1,
      title: 'Note 1',
      content: 'Content 1',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    ),
    NoteModel(
      id: 2,
      title: 'Note 2',
      content: 'Content 2',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    ),
    NoteModel(
      id: 3,
      title: 'Note 3',
      content: 'Content 3',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    ),
  ];

  Future<List<NoteModel>> getNotes(BuildContext context) async {
    AppState appState = context.read<AppState>();
    NoteRepository noteRepo = appState.getNoteRepo(context);

    return await noteRepo.getNotes();
  }
}
