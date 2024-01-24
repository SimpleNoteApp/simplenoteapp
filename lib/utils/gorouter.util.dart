import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simplenoteapp/pages/myhome.page.dart';
import 'package:simplenoteapp/pages/noteeditor.page.dart';
import 'package:simplenoteapp/pages/settings.page.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    pageBuilder: (context, state) => MaterialPage<dynamic>(child: HomePage()),
  ),
  GoRoute(
    path: "/settings",
    pageBuilder: (context, state) =>
        MaterialPage<dynamic>(child: SettingsPage()),
  ),
  GoRoute(
      path: "/note/new",
      pageBuilder: (context, state) =>
          MaterialPage<dynamic>(child: NoteEditorPage()))
]);
