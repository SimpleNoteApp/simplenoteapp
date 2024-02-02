import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/widgets/notecard.widget.dart';

class NoteView extends StatelessWidget {
  final List<NoteModel> notes;

  const NoteView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: notes.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 730 ? 2 : 1,
                    childAspectRatio:
                        constraints.maxWidth < 1200 ? 1 / .575 : 1 / .35,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteCard(note: notes[index]);
                  },
                )
              : const Center(
                  child: Text("Notes not found"),
                ),
        );
      },
    );
  }
}
