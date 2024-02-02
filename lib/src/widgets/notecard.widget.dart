import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/utils/date.util.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AspectRatio(
        aspectRatio: 1 / 0.6,
        child: Material(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                NoteContentView(note: note),
                NoteCreatedAt(note: note),
                ButtonMenu(
                  note: note,
                ),
              ],
            ),
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
        Tooltip(
          message: 'Open note: ${note.title}',
          child: TextButton(
            onPressed: () {
              context.push("/note/${note.id}");
            },
            child: Text(note.title, style: const TextStyle(fontSize: 20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            note.content.length > 50
                ? "${note.content.substring(0, 50)}..."
                : note.content,
          ),
        ),
      ],
    );
  }
}

class ButtonMenu extends StatelessWidget {
  final NoteModel note;
  const ButtonMenu({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Row(
        children: [
          EditNoteButton(note: note),
          const SizedBox(width: 10),
          DeleteNoteButton(note: note),
        ],
      ),
    );
  }
}
