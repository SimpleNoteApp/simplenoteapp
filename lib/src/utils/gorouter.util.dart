import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/modules/home/home.view.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteedit.view.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: "/",
      pageBuilder: (context, state) =>
          MaterialPage(child: HomeView(controller: HomeController()))),
  GoRoute(
      path: "/note/new",
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage(child: NoteEditorView()))
]);
