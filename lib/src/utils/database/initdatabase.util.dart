import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

const String createTableQuery =
    'CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdAt TEXT, updatedAt TEXT)';

// Function to open a database at the given path.
// If the database is opened for the first time, it executes the 'createTableQuery' to create the 'notes' table.
Future<Database> openDb(String path) async {
  return await openDatabase(
    path,
    onCreate: (db, version) {
      return db.execute(createTableQuery);
    },
    version: 1,
  );
}

// Function to initialize the database.
// If the platform is Linux or Windows, it initializes the FFI version of sqflite.
// It then opens the database at the path 'app.db' in the databases directory.
// If an error occurs while opening the database, it rethrows the error.
Future<Database> initDatabase() async {
  
  if (Platform.isLinux || Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  final dbPath = join(await getDatabasesPath(), 'app.db');

  try {
    Database database = await openDb(dbPath);
    return database;
  } catch (e) {
    rethrow;
  }
}
