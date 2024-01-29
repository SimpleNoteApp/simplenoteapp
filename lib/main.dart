//package imports
import 'package:simplenoteapp/src/app.state.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

// local imports
import 'package:simplenoteapp/src/app.dart';

Future<Database> initDatabase() async {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  final dbPath = join(await getDatabasesPath(), 'app.db');

  return openDatabase(
    dbPath,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, createdAt TEXT, updatedAt TEXT)',
      );
    },
    version: 1,
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<Database>(
    future: initDatabase(),
    builder: (BuildContext context, AsyncSnapshot<Database> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) =>
                    AppState(database: snapshot.data!))
          ],
          child: const App(),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        ); // or some other loading widget
      }
    },
  ));
}
