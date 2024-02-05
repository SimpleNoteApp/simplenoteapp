import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// local imports
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/utils/initdatabase.util.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/app.dart';

/// The main entry point for the application.
///
/// It initializes the database and then builds the app.
/// The app is wrapped in a [FutureBuilder] to ensure the database is initialized before the app is built.
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(FutureBuilder<Database>(
    future: initDatabase(),
    builder: (BuildContext context, AsyncSnapshot<Database> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          // Build the app with the initialized database
          return buildApp(snapshot.data!);
        } else {
          // Handle the error when the database is null
          return const MaterialApp(
              home: Scaffold(
                  body: Center(child: Text('Error: snapshot.data is null'))));
        }
      } else {
        // Show a loading spinner while waiting for the database to initialize
        return buildLoading();
      }
    },
  ));
}

/// Builds the app with the provided [Database].
///
/// The [Database] is used to initialize the [NoteRepository].
Widget buildApp(Database database) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => SettingsState(),
      ),
      ChangeNotifierProvider(
          create: (BuildContext context) => NoteRepository(database: database)),
      ChangeNotifierProvider(
          create: (BuildContext context) => NoteEditorState()),
    ],
    child: const App(),
  );
}

/// Builds a loading widget.
///
/// The loading widget is a [CircularProgressIndicator] centered on the screen.
Widget buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
