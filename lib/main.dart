// package imports
import 'dart:io';

import 'package:simplenoteapp/src/app.state.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

// local imports
import 'package:simplenoteapp/src/app.dart';

Future<void> main() async {
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  Database database = await openDatabase(
      join(await getDatabasesPath(), 'app.db'), onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdAt TEXT, updatedAt TEXT)',
    );
  }, version: 1);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => AppState(database: database))
    ],
    child: const App(),
  ));
}
