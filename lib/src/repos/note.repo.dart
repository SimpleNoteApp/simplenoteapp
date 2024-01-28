import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class NoteRepository {
  Database database;

  NoteRepository({required this.database});

  Future<List<NoteModel>> getNotes() async {
    List<Map<String, dynamic>> notes = await database.query('notes');

    return notes.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<NoteModel> getNoteById(int id) async {
    List<Map<String, dynamic>> notes =
        await database.query('notes', where: 'id = ?', whereArgs: [id]);

    return NoteModel.fromJson(notes.first);
  }

  Future<void> create(NoteModel note) async {
    await database.insert('notes', note.toJson());
  }

  Future<void> update(NoteModel note) async {
    await database
        .update('notes', note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> delete(int id) async {
    await database.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
