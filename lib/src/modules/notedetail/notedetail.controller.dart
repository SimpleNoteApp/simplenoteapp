import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

class NoteDetailController {
  int noteId;

  NoteDetailController({required this.noteId});

  Future<NoteModel> getNote(BuildContext context) async {
    NoteRepository noteRepo = context.read<NoteRepository>();

    return await noteRepo.getNoteById(noteId);
  }
}
