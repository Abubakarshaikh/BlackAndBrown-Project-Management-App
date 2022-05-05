import 'dart:convert';

class User {
  final int id;
  final int departmentId;
  final String name;
  final String email;
  const User({
    required this.id,
    required this.departmentId,
    required this.name,
    required this.email,
  });

  User copyWith({
    int? id,
    int? departmentId,
    String? name,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      departmentId: departmentId ?? this.departmentId,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'departmentId': departmentId,
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      departmentId: map['departmentId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, departmentId: $departmentId, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.departmentId == departmentId &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ departmentId.hashCode ^ name.hashCode ^ email.hashCode;
  }
}
