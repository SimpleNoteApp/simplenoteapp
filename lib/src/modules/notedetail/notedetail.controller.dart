import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

/// [NoteDetailController] is a controller for the [NoteDetailView].
///
/// It fetches a specific note from the [NoteRepository] based on the provided [noteId]
/// and returns it to the [NoteDetailView].
///
class NoteDetailController {
  int noteId;

  /// Constructs a [NoteDetailController] with a given [noteId].
  ///
  /// [noteId] is the identifier of the note to be fetched from the [NoteRepository].
  NoteDetailController({required this.noteId});

  /// Fetches a specific note from the [NoteRepository].
  ///
  /// This method uses the [BuildContext] to access the [NoteRepository] and fetch the note.
  /// It returns a [Future] that completes with a [NoteModel] representing the fetched note.
  ///
  /// [context] is the [BuildContext] used to access the [NoteRepository].
  Future<NoteModel> getNote(BuildContext context) async {
    NoteRepository noteRepo = context.read<NoteRepository>();

    return await noteRepo.getNoteById(noteId);
  }
}
