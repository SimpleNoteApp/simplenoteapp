import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/widgets/notecard.widget.dart';

/// [NoteView] is a stateless widget that displays a list of notes.
///
/// It takes a list of [NoteModel] as a required parameter and displays them in a grid view.
/// If the list is empty, it displays a "Notes not found" message.
class NoteView extends StatelessWidget {
  final List<NoteModel> notes;

  const NoteView({super.key, required this.notes});

  /// Builds the widget.
  ///
  /// Uses a [LayoutBuilder] to adapt the layout based on the parent widget's constraints.
  /// This allows the grid to have a responsive design, with the number of columns and the aspect ratio of the grid items changing based on the width of the parent widget.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the number of columns based on the width of the parent widget.
        // This allows the grid to have 2 columns when there is enough horizontal space, and 1 column otherwise.
        final crossAxisCount = constraints.maxWidth > 730 ? 2 : 1;

        // Determine the aspect ratio of the grid items based on the width of the parent widget.
        // This allows the grid items to have a larger aspect ratio when there is more horizontal space, and a smaller aspect ratio otherwise.
        final childAspectRatio =
            constraints.maxWidth < 1200 ? 1 / .575 : 1 / .35;

        return Padding(
          padding: const EdgeInsets.all(10),
          child: notes.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: childAspectRatio,
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
