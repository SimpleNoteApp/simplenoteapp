import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/widgets/notecard.widget.dart';

class NoteView extends StatelessWidget {
  final List<NoteModel> notes;

  const NoteView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteCard(note: notes[index]);
      },
    );
  }
}
