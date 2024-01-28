import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AppState with ChangeNotifier {
  Database database;

  AppState({required this.database});

  dynamic getNoteRepo(BuildContext context) {
    return NoteRepository(database: database);
  }
}
