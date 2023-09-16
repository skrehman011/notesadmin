class Notes{
  String id, title, note,userId;

//<editor-fold desc="Data Methods">
  Notes({
    required this.id,
    required this.title,
    required this.note,
    required this.userId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Notes &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              note == other.note &&
              userId == other.userId);

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ note.hashCode ^ userId.hashCode;

  @override
  String toString() {
    return 'Notes{' +
        ' id: $id,' +
        ' title: $title,' +
        ' note: $note,' +
        ' userId: $userId,' +
        '}';
  }

  Notes copyWith({
    String? id,
    String? title,
    String? note,
    String? userId,
  }) {
    return Notes(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'note': this.note,
      'userId': this.userId,
    };
  }

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      id: map['id'] as String,
      title: map['title'] as String,
      note: map['note'] as String,
      userId: map['userId'] as String,
    );
  }

//</editor-fold>
}