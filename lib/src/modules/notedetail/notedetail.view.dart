import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/modules/notedetail/notedetail.controller.dart';
import 'package:simplenoteapp/src/utils/date.util.dart';
import 'package:simplenoteapp/src/widgets/appbars.widgets.dart';

/// [NoteDetailView] serves as the detailed view of a note.
///
/// The page displays the title and content of the note.
///
/// [NoteDetailController] is leveraged to fetch the note from the [NoteRepository].
///
/// The app bar is rendered using the [noteDetailAppBar] widget.
///
/// The note is represented using an instance of [NoteModel].
///
/// The [FutureBuilder] widget is employed to handle the asynchronous loading of the note.
///
class NoteDetailView extends StatelessWidget {
  final NoteDetailController controller;

  /// Constructs a new [NoteDetailView] widget.
  ///
  /// [controller] is the [NoteDetailController] that will be used to fetch the note.
  ///
  const NoteDetailView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NoteModel>(
      future: controller.getNote(context),
      builder: (BuildContext context, AsyncSnapshot<NoteModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          NoteModel note = snapshot.data!;
          return NoteDetailLayout(note: note);
        }
      },
    );
  }
}

class NoteDetailLayout extends StatelessWidget {
  final NoteModel note;

  const NoteDetailLayout({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool canPop) {
        context.pop();
      },
      child: Scaffold(
        appBar: noteDetailAppBar(context, note),
        body: NoteDetailBody(note: note),
      ),
    );
  }
}

class NoteDetailBody extends StatelessWidget {
  final NoteModel note;

  const NoteDetailBody({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: FractionallySizedBox(
        widthFactor: width > 1000 ? 0.625 : 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Created ${timestampToDateString(note.createdAt)}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                note.title,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(note.content,
                      style: const TextStyle(fontSize: 16.725, height: 1.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
