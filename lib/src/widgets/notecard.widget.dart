import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/utils/date.util.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';

/// [NoteCard] is a stateless widget that displays a single note.
///
/// It takes a [NoteModel] as a required parameter and displays the note's title, content, and creation date.
/// It also includes a menu with buttons to edit and delete the note.
class NoteCard extends StatelessWidget {
  /// The note to display.
  final NoteModel note;

  /// Creates a new instance of [NoteCard].
  ///
  /// Takes a [NoteModel] as a required parameter.
  const NoteCard({super.key, required this.note});

  /// Builds the widget.
  ///
  /// Uses a [Padding] widget to add space around the note card.
  /// The note card has a fixed aspect ratio of 1 / 0.6.
  ///
  /// The note's title, content, and creation date are displayed in a stack.
  /// The title and content are displayed in a [NoteContentView], and the creation date is displayed in a [NoteCreatedAt].
  /// A [ButtonMenu] with buttons to edit and delete the note is also included in the stack.
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

/// [NoteCreatedAt] is a stateless widget that displays the creation date of a note.
///
/// It takes a [NoteModel] as a required parameter and displays the note's creation date in the top right corner of the parent widget.
class NoteCreatedAt extends StatelessWidget {
  /// The note whose creation date to display.
  final NoteModel note;

  /// Creates a new instance of [NoteCreatedAt].
  ///
  /// Takes a [NoteModel] as a required parameter.
  const NoteCreatedAt({
    super.key,
    required this.note,
  });

  /// Builds the widget.
  ///
  /// Uses a [Positioned] widget to position the creation date in the top right corner of the parent widget.
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

/// [NoteContentView] is a stateless widget that displays the title and content of a note.
///
/// It takes a [NoteModel] as a required parameter and displays the note's title as a button that opens the note when clicked,
/// and the note's content as a text.
class NoteContentView extends StatelessWidget {
  /// The note whose title and content to display.
  final NoteModel note;

  /// Creates a new instance of [NoteContentView].
  ///
  /// Takes a [NoteModel] as a required parameter.
  const NoteContentView({
    super.key,
    required this.note,
  });

  /// Builds the widget.
  ///
  /// The note's title is displayed as a button that opens the note when clicked.
  /// The note's content is displayed as a text. If the content is longer than 50 characters, only the first 50 characters are displayed, followed by "...".
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

/// [ButtonMenu] is a stateless widget that displays a menu with buttons to edit and delete a note.
///
/// It takes a [NoteModel] as a required parameter and displays the menu in the bottom right corner of the parent widget.
class ButtonMenu extends StatelessWidget {
  /// The note to which the menu applies.
  final NoteModel note;

  /// Creates a new instance of [ButtonMenu].
  ///
  /// Takes a [NoteModel] as a required parameter.
  const ButtonMenu({
    super.key,
    required this.note,
  });

  /// Builds the widget.
  ///
  /// Uses a [Positioned] widget to position the menu in the bottom right corner of the parent widget.
  /// The menu includes an [EditNoteButton] and a [DeleteNoteButton].
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
