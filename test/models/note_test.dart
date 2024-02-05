import 'package:flutter_test/flutter_test.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

void main() {
  group('NoteModel', () {
    test('should create a NoteModel correctly with constructor', () {
      final note = NoteModel(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
        createdAt: '2022-01-01',
        updatedAt: '2022-01-02',
      );

      expect(note.id, 1);
      expect(note.title, 'Test Title');
      expect(note.content, 'Test Content');
      expect(note.createdAt, '2022-01-01');
      expect(note.updatedAt, '2022-01-02');
    });

    test('should create a NoteModel correctly from JSON', () {
      final json = {
        "id": 1,
        "title": "Test Title",
        "content": "Test Content",
        "createdAt": "2022-01-01",
        "updatedAt": "2022-01-02",
      };

      final note = NoteModel.fromJson(json);

      expect(note.id, 1);
      expect(note.title, 'Test Title');
      expect(note.content, 'Test Content');
      expect(note.createdAt, '2022-01-01');
      expect(note.updatedAt, '2022-01-02');
    });

    test('should convert a NoteModel correctly to JSON', () {
      final note = NoteModel(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
        createdAt: '2022-01-01',
        updatedAt: '2022-01-02',
      );

      final json = note.toJson();

      expect(json["id"], 1);
      expect(json["title"], 'Test Title');
      expect(json["content"], 'Test Content');
      expect(json["createdAt"], '2022-01-01');
      expect(json["updatedAt"], '2022-01-02');
    });

    test('should return a correct string representation', () {
      final note = NoteModel(
        id: 1,
        title: 'Test Title',
        content: 'Test Content',
        createdAt: '2022-01-01',
        updatedAt: '2022-01-02',
      );

      final string = note.toString();

      expect(string,
          'NoteModel{id: 1, title: Test Title, content: Test Content, createdAt: 2022-01-01, updatedAt: 2022-01-02}');
    });
  });
}
