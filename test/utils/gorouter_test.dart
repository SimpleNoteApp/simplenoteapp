import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:simplenoteapp/src/modules/home/home.view.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.state.dart';
import 'package:simplenoteapp/src/modules/settings/settings.state.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:simplenoteapp/src/utils/gorouter.util.dart' as r;

import '../mocks.dart';

void main() {
  testWidgets('HomeView opens on "/" route', (WidgetTester tester) async {
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
        child: MaterialApp.router(
          routerConfig: r.router,
        ),
      ),
    );

    r.router.go('/');

    await tester.pumpAndSettle();

    expect(find.byType(HomeView), findsOneWidget);
  });
}
