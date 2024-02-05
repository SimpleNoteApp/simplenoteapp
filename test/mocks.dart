import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockDatabase extends Mock implements Database {
  get version => 1;
}

class MockDatabaseFactory extends Mock implements DatabaseFactory {
  @override
  Future<Database> openDatabase(String path,
          {OpenDatabaseOptions? options}) async =>
      MockDatabase();
}

class MockSettingsState extends Mock implements SettingsState {
  @override
  bool get isDarkTheme => super.noSuchMethod(
        Invocation.getter(#isDarkTheme),
        returnValue: true,
        returnValueForMissingStub: true,
      );
}

class MockNoteRepository extends Mock implements NoteRepository {}

class MockNoteEditorState extends Mock implements NoteEditorState {}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AddNewNoteButton()),
    GoRoute(
        path: '/note/new', builder: (context, state) => const Text('New Note')),
    GoRoute(
        path: "/note/:id/edit",
        builder: (context, state) => const Text('Edit Note')),
    GoRoute(
        path: "/settings", builder: (context, state) => const Text('Settings')),
  ],
);
