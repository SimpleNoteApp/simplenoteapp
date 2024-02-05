import 'package:flutter_test/flutter_test.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/repos/note.repo.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('NoteRepository', () {
    late Database database;
    late NoteRepository noteRepository;

    setUp(() async {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath,
          options: OpenDatabaseOptions(
            version: 1,
            onCreate: (db, version) async {
              await db.execute('''
            CREATE TABLE notes(
              id INTEGER PRIMARY KEY,
              title TEXT,
              content TEXT,
              createdAt TEXT,
              updatedAt TEXT
            )
          ''');
            },
          ));

      noteRepository = NoteRepository(database: database);
    });

    tearDown(() async {
      // Close the database
      await database.close();
    });

    test('getNotes returns a list of NoteModel', () async {
      // Insert a note
      await database.insert('notes', {
        "id": 1,
        "title": "Test Title",
        "content": "Test Content",
        "createdAt": "2022-01-01",
        "updatedAt": "2022-01-02",
      });

      final notes = await noteRepository.getNotes();

      expect(notes, isA<List<NoteModel>>());
      expect(notes.first.id, 1);
      expect(notes.first.title, 'Test Title');
      expect(notes.first.content, 'Test Content');
      expect(notes.first.createdAt, '2022-01-01');
      expect(notes.first.updatedAt, '2022-01-02');
    });

    test('getNoteById returns a NoteModel', () async {
      // Insert a note
      await database.insert('notes', {
        "id": 1,
        "title": "Test Title",
        "content": "Test Content",
        "createdAt": "2022-01-01",
        "updatedAt": "2022-01-02",
      });

      final note = await noteRepository.getNoteById(1);

      expect(note, isA<NoteModel>());
      expect(note.id, 1);
      expect(note.title, 'Test Title');
      expect(note.content, 'Test Content');
      expect(note.createdAt, '2022-01-01');
      expect(note.updatedAt, '2022-01-02');
    });

    test('create a note', () async {
      final note = NoteModel(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
        createdAt: '2022-01-01',
        updatedAt: '2022-01-02',
      );

      await noteRepository.create(note);

      final notes = await noteRepository.getNotes();

      expect(notes.length, 1);
      expect(notes.first.id, 1);
      expect(notes.first.title, 'Test Title');
      expect(notes.first.content, 'Test Content');
      expect(notes.first.createdAt, '2022-01-01');
      expect(notes.first.updatedAt, '2022-01-02');
    });

    test('update a note', () async {
      // Insert a note
      await database.insert('notes', {
        "id": 1,
        "title": "Test Title",
        "content": "Test Content",
        "createdAt": "2022-01-01",
        "updatedAt": "2022-01-02",
      });

      final note = NoteModel(
        id: 1,
        title: 'Updated Title',
        content: 'Updated Content',
        createdAt: '2022-01-01',
        updatedAt: '2022-01-03',
      );

      await noteRepository.update(note);

      final notes = await noteRepository.getNotes();

      expect(notes.length, 1);
      expect(notes.first.id, 1);
      expect(notes.first.title, 'Updated Title');
      expect(notes.first.content, 'Updated Content');
      expect(notes.first.createdAt, '2022-01-01');
      expect(notes.first.updatedAt, '2022-01-03');
    });

    test('delete a note', () async {
      // Insert a note
      await database.insert('notes', {
        "id": 1,
        "title": "Test Title",
        "content": "Test Content",
        "createdAt": "2022-01-01",
        "updatedAt": "2022-01-02",
      });

      await noteRepository.delete(1);

      final notes = await noteRepository.getNotes();

      expect(notes.length, 0);
    });
  });
}
