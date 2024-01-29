import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/widgets/notecard.widget.dart';

class NoteView extends StatelessWidget {
  final List<NoteModel> notes;

  const NoteView({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 850 ? 2 : 1,
            childAspectRatio: constraints.maxWidth < 1400 ? 1 / .45 : 1 / .35,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(note: notes[index]);
          },
        );
      },
    );
  }
}
