import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

class HomeController {
  Future<List<NoteModel>> getNotes(BuildContext context) async {
    NoteRepository noteRepository = context.read<NoteRepository>();

    return await noteRepository.getNotes();
  }
}
