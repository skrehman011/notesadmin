class Student {
  String id, name, email, password;

//<editor-fold desc="Data Methods">
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Student &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              email == other.email &&
              password == other.password);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'Student{' +
        ' id: $id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' password: $password,' +
        '}';
  }

  Student copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'password': this.password,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}