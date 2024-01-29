import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/utils/date.util.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 0.5, // This will make the card's height twice its width
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              NoteContentView(note: note),
              NoteCreatedAt(note: note),
              const EditNote(),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteCreatedAt extends StatelessWidget {
  const NoteCreatedAt({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Text(
        timestampToDateString(note.createdAt),
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

class NoteContentView extends StatelessWidget {
  const NoteContentView({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          note.content.length > 50
              ? "${note.content.substring(0, 50)}..."
              : note.content,
        ),
      ],
    );
  }
}

class EditNote extends StatelessWidget {
  const EditNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 0,
      right: 0,
      child: EditNoteButton(),
    );
  }
}
