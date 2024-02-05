import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/widgets/appbars.widgets.dart';
import 'package:simplenoteapp/src/widgets/noteview.widget.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

/// [HomeView] serves as the home page of the app, showcasing a list of notes.
///
/// The page provides functionality to add new notes and access settings.
///
/// [HomeController] is leveraged to fetch the notes from the [NoteRepository].
///
/// Individual notes are displayed using the [NoteView] widget.
///
/// The app bar is rendered using the [homePageAppBar] widget.
///
/// As a [StatefulWidget], it utilizes the [Consumer] widget to access the [NoteRepository].
///
/// The [FutureBuilder] widget is employed to handle the asynchronous loading of notes.
///
/// Notes are represented using instances of [NoteModel].
///
class HomeView extends StatefulWidget {
  /// Constructs a new [HomeView] widget.
  ///
  /// [controller] is the [HomeController] that will be used to fetch the notes.
  const HomeView({super.key, required this.controller});

  final HomeController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: Center(
        child: Consumer<NoteRepository>(
          builder: (context, noteRepository, child) {
            return FutureBuilder<List<NoteModel>>(
              future: widget.controller.getNotes(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return NoteView(notes: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: Text("Notes not found"));
                }
              },
            );
          },
        ),
      ),
    );
  }
}
