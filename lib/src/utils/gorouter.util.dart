import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:simplenoteapp/src/modules/home/home.controller.dart';
import 'package:simplenoteapp/src/modules/home/home.view.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: "/",
      pageBuilder: (context, state) =>
          MaterialPage(child: HomeView(controller: HomeController()))),
]);
