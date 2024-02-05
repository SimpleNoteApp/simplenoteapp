import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/main.dart';

import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/app.dart';

import 'mocks.dart';

void main() {
  testWidgets('Test main app initialization', (WidgetTester tester) async {
    final mockDatabase = MockDatabase();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => SettingsState(),
          ),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  NoteRepository(database: mockDatabase)),
          ChangeNotifierProvider(
              create: (BuildContext context) => NoteEditorState()),
        ],
        child: const App(),
      ),
    );

    // Check if the app is correctly built
    expect(find.byType(App), findsOneWidget);
  });

  testWidgets('Test loading state', (WidgetTester tester) async {
    await tester.pumpWidget(buildLoading());

    // Check if CircularProgressIndicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
