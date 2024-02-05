import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/widgets/notecard.widget.dart';
import 'package:simplenoteapp/src/widgets/noteview.widget.dart';

void main() {
  final List<NoteModel> emptyNotes = [];
  final List<NoteModel> nonEmptyNotes = [
    NoteModel(
        title: 'Test Note',
        content: 'Test Content',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String()),
  ];

  testWidgets('Displays "Notes not found" when the notes list is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NoteView(notes: emptyNotes)));

    expect(find.text('Notes not found'), findsOneWidget);
  });

  testWidgets(
      'Displays a NoteCard for each note when the notes list is not empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NoteView(notes: nonEmptyNotes)));

    expect(find.byType(NoteCard), findsNWidgets(nonEmptyNotes.length));
  });
}
