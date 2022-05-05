import 'dart:convert';

// * get departments columns and their total projects.

class Department {
  final int id;
  final String name;
  final int totalProjects;
  final int completedProjects;
  const Department({
    required this.id,
    required this.name,
    required this.totalProjects,
    required this.completedProjects,
  });

  Department copyWith({
    int? id,
    String? name,
    int? totalProjects,
    int? completedProjects,
  }) {
    return Department(
      id: id ?? this.id,
      name: name ?? this.name,
      totalProjects: totalProjects ?? this.totalProjects,
      completedProjects: completedProjects ?? this.completedProjects,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalProjects': totalProjects,
      'completedProjects': completedProjects,
    };
  }

  factory Department.fromMap(Map<String, dynamic> map) {
    return Department(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      totalProjects: map['totalProjects']?.toInt() ?? 0,
      completedProjects: map['completedProjects']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Department.fromJson(String source) =>
      Department.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Department(id: $id, name: $name, totalProjects: $totalProjects, completedProjects: $completedProjects)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Department &&
      other.id == id &&
      other.name == name &&
      other.totalProjects == totalProjects &&
      other.completedProjects == completedProjects;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      totalProjects.hashCode ^
      completedProjects.hashCode;
  }
}
