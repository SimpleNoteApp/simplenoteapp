import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

const String createTableQuery =
    'CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdAt TEXT, updatedAt TEXT)';

Future<Database> initDatabase() async {
  if (Platform.isLinux || Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  final dbPath = join(await getDatabasesPath(), 'app.db');

  try {
    Database database = await openDatabase(
      dbPath,
      onCreate: (db, version) {
        return db.execute(createTableQuery);
      },
      version: 1,
    );

    return database;
  } catch (e) {
    rethrow;
  }
}
