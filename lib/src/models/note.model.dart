/// A model representing a note in the application.
///
/// Each note has a unique [id], a [title], and [content]. It also keeps track
/// of when it was [createdAt] and when it was last [updatedAt].
class NoteModel {
  int? id;
  String title;
  String content;
  String createdAt;
  String updatedAt;

  /// Creates a new note with the given [title], [content], [createdAt], and [updatedAt].
  ///
  /// The [id] is optional and should be provided if the note already exists in the database.
  NoteModel({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Creates a new note from a JSON object.
  ///
  /// This is typically used when loading notes from the database.
  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  /// Converts this note to a JSON object.
  ///
  /// This is typically used when saving the note to the database.
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };

  /// Returns a string representation of the note.
  ///
  /// This can be useful for debugging or logging.
  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
