import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/app.dart';

import 'mocks.dart';

void main() {
  testWidgets('Test main app initialization', (WidgetTester tester) async {
    final mockSettingsState = MockSettingsState();

    final mockNoteRepository = MockNoteRepository();
    final mockNoteEditorState = MockNoteEditorState();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SettingsState>(
            create: (BuildContext context) => mockSettingsState,
          ),
          ChangeNotifierProvider<NoteRepository>(
            create: (BuildContext context) => mockNoteRepository,
          ),
          ChangeNotifierProvider<NoteEditorState>(
            create: (BuildContext context) => mockNoteEditorState,
          ),
        ],
        child: const App(),
      ),
    );

    // Add this line
    await tester.pump();

    // Check if the app is correctly built
    expect(find.byType(App), findsOneWidget);
  });
}
