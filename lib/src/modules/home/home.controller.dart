import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

/// [HomeController] is a controller for the [HomeView].
///
/// It is responsible for fetching the notes from the [NoteRepository]
/// and returning them to the [HomeView].
///
class HomeController {
  NoteRepository? noteRepository;

  HomeController({this.noteRepository});

  /// Fetches the notes from the [NoteRepository].
  ///
  /// This method uses the [BuildContext] to access the [NoteRepository] and fetch the notes.
  /// It returns a [Future] that completes with a [List] of [NoteModel].
  ///
  /// [context] is the [BuildContext] that will be used to access the [NoteRepository].
  Future<List<NoteModel>> getNotes(BuildContext context) async {
    noteRepository ??= context.read<NoteRepository>();

    return await noteRepository!.getNotes();
  }
}
