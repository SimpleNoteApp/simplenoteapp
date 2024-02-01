import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AppState with ChangeNotifier {
  Database database;
  NoteRepository? _noteRepository;

  AppState({required this.database});

  NoteRepository getNoteRepo(BuildContext context) {
    _noteRepository ??= NoteRepository(database: database);
    return _noteRepository!;
  }
}
