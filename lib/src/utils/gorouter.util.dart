import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/modules/notedetail/notedetail.controller.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/modules/settings/settings.controller.dart';
import 'package:simplenoteapp/src/modules/notedetail/notedetail.view.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.view.dart';
import 'package:simplenoteapp/src/modules/settings/settings.view.dart';
import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/modules/home/home.view.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

// This is the main router for the application.
// It defines the routes for the home page, settings page, new note page, note detail page, and note edit page.
final router = GoRouter(
  // The initial location is the home page.
  initialLocation: "/",
  routes: [
    // This route is for the home page.
    // It uses the HomeController and the HomeView.
    GoRoute(
      path: "/",
      pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage(
        child: HomeView(controller: HomeController()),
      ),
    ),
    // This route is for the settings page.
    // It uses the SettingsController and the SettingsView.
    GoRoute(
      path: "/settings",
      pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage(
        child: SettingsView(
          controller: SettingsContoller(context),
        ),
      ),
    ),
    // This route is for the new note page.
    // It uses the NoteEditController and the NoteEditorView.
    GoRoute(
      path: "/note/new",
      pageBuilder: (BuildContext context, GoRouterState state) => MaterialPage(
        child: NoteEditorView(
          controller: NoteEditController(),
        ),
      ),
    ),
    // This route is for the note detail page.
    // It uses the NoteDetailController and the NoteDetailView.
    // The note id is extracted from the path parameters.
    // If the note id is invalid, it shows a text widget with the message "Invalid note id".
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
    // This route is for the note edit page.
    // It uses the NoteEditController and the NoteEditorView.
    // The note to be edited is fetched from the NoteRepository using the note id extracted from the path parameters.
    // If the note id is invalid, it shows a text widget with the message "Invalid note id".
    // While the note is being fetched, it shows a CircularProgressIndicator.
    // If an error occurs while fetching the note, it shows a text widget with the error message.
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
