import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenoteapp/src/widgets/dialogs.widgets.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  testWidgets('errorDialog shows dialog with correct title and content',
      (WidgetTester tester) async {
    var mockNoteRepository = MockNoteRepository();

    await tester.pumpWidget(
      Provider<NoteRepository>(
        create: (context) => mockNoteRepository,
        child: MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => errorDialog(context, "Test error"),
              child: const Text('Show dialog'),
            ),
          ),
        ),
      ),
    );

    // Tap the button to show the dialog
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Check that the dialog is displayed
    expect(find.text('Error'), findsOneWidget);
    expect(find.text('Test error'), findsOneWidget);
  });
}
