import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/widgets/appbars.widgets.dart';
import 'package:simplenoteapp/src/widgets/noteview.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.controller});

  final HomeController controller;

  static const String routeName = '/';

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
