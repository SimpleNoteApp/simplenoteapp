import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/modules/home/home.view.dart';
import 'package:simplenoteapp/src/modules/notedetail/notedetail.controller.dart';
import 'package:simplenoteapp/src/modules/notedetail/notedetail.view.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.view.dart';
import 'package:simplenoteapp/src/modules/settings/settings.controller.dart';
import 'package:simplenoteapp/src/modules/settings/settings.view.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => MaterialPage(
        child: HomeView(controller: HomeController()),
      ),
    ),
    GoRoute(
      path: "/settings",
      pageBuilder: (context, state) => MaterialPage(
        child: SettingsView(
          controller: SettingsContoller(),
        ),
      ),
    ),
    GoRoute(
      path: "/note/new",
      pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage(
        child: NoteEditorView(
          controller: NoteEditController(),
        ),
      ),
    ),
    GoRoute(
        path: "/note/:id",
        pageBuilder: (context, state) {
          int? id = int.tryParse(state.pathParameters['id']!);

          if (id != null) {
            return MaterialPage(
                child: NoteDetailView(
                    controller: NoteDetailController(noteId: id)));
          } else {
            return const MaterialPage(child: Text('Invalid note id'));
          }
        }),
    GoRoute(
      path: "/note/:id/edit",
      pageBuilder: (context, state) {
        int? id = int.tryParse(state.pathParameters['id']!);
        if (id != null) {
          return MaterialPage(
            child: FutureBuilder<NoteModel>(
              future: context.read<NoteRepository>().getNoteById(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return NoteEditorView(
                    controller: NoteEditController(note: snapshot.data!),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          );
        } else {
          return const MaterialPage(child: Text('Invalid note id'));
        }
      },
    ),
  ],
);
