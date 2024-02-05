import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/utils/date.util.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';
import 'package:simplenoteapp/src/widgets/notecard.widget.dart';

void main() {
  final NoteModel testNote = NoteModel(
      id: 1,
      title: 'Test Note',
      content: 'Test Content',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String());

  testWidgets('Displays NoteCard with correct data',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Stack(children: [NoteCard(note: testNote)])));

    expect(find.text(testNote.title), findsOneWidget);
    expect(
        find.text(testNote.content.length > 50
            ? "${testNote.content.substring(0, 50)}..."
            : testNote.content),
        findsOneWidget);
  });

  testWidgets('Displays NoteCreatedAt with correct timestamp',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Stack(children: [NoteCreatedAt(note: testNote)])));

    expect(
        find.text(timestampToDateString(testNote.createdAt)), findsOneWidget);
  });

  testWidgets('Displays NoteContentView with correct content',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Stack(children: [NoteContentView(note: testNote)])));

    expect(find.text(testNote.title), findsOneWidget);
    expect(
        find.text(testNote.content.length > 50
            ? "${testNote.content.substring(0, 50)}..."
            : testNote.content),
        findsOneWidget);
  });

  testWidgets('Displays ButtonMenu with edit and delete buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Stack(children: [ButtonMenu(note: testNote)])));

    expect(find.byType(EditNoteButton), findsOneWidget);
    expect(find.byType(DeleteNoteButton), findsOneWidget);
  });
}
