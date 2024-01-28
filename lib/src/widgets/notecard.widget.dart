import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
      ),
    );
  }
}
