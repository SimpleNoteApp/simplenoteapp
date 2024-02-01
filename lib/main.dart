import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/utils/initdatabase.util.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// local imports
import 'package:simplenoteapp/src/app.dart';
import 'package:simplenoteapp/src/app.state.dart';

Widget buildApp(Database database) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => SettingsState(),
        child: const App(),
      ),
      ChangeNotifierProvider(
          create: (BuildContext context) => AppState(database: database)),
      ChangeNotifierProvider(
          create: (BuildContext context) => NoteRepository(database: database)),
      ChangeNotifierProvider(
          create: (BuildContext context) => NoteEditorState()),
    ],
    child: const App(),
  );
}

Widget buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<Database>(
    future: initDatabase(),
    builder: (BuildContext context, AsyncSnapshot<Database> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          return buildApp(snapshot.data!);
        } else {
          return const MaterialApp(
              home: Scaffold(
                  body: Center(child: Text('Error: snapshot.data is null'))));
        }
      } else {
        return buildLoading();
      }
    },
  ));
}
