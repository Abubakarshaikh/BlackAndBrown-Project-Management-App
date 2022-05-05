import 'dart:convert';

class Project {
  final int id;
  final String departmentName;
  final String name;
  final String descriptions;
  final bool status;
  final int percentage;
  final DateTime deadline;
  final DateTime createdAt;
  const Project({
    required this.id,
    required this.departmentName,
    required this.name,
    required this.descriptions,
    required this.status,
    required this.percentage,
    required this.deadline,
    required this.createdAt,
  });

  Project copyWith({
    int? id,
    String? departmentName,
    String? name,
    String? descriptions,
    bool? status,
    int? percentage,
    DateTime? deadline,
    DateTime? createdAt,
  }) {
    return Project(
      id: id ?? this.id,
      departmentName: departmentName ?? this.departmentName,
      name: name ?? this.name,
      descriptions: descriptions ?? this.descriptions,
      status: status ?? this.status,
      percentage: percentage ?? this.percentage,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'departmentName': departmentName,
      'name': name,
      'descriptions': descriptions,
      'status': status,
      'percentage': percentage,
      'deadline': deadline.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id']?.toInt() ?? 0,
      departmentName: map['departmentName'] ?? '',
      name: map['name'] ?? '',
      descriptions: map['descriptions'] ?? '',
      status: map['status'] ?? false,
      percentage: map['percentage']?.toInt() ?? 0,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] * 1000),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] * 1000),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Project(id: $id, departmentName: $departmentName, name: $name, descriptions: $descriptions, status: $status, percentage: $percentage, deadline: $deadline, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Project &&
        other.id == id &&
        other.departmentName == departmentName &&
        other.name == name &&
        other.descriptions == descriptions &&
        other.status == status &&
        other.percentage == percentage &&
        other.deadline == deadline &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        departmentName.hashCode ^
        name.hashCode ^
        descriptions.hashCode ^
        status.hashCode ^
        percentage.hashCode ^
        deadline.hashCode ^
        createdAt.hashCode;
  }
}
