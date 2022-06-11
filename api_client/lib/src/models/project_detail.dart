import 'dart:convert';

class ProjectDetail {
  final int id;
  final int departmentId;
  final String name;
  final String descriptions;
  final double percentage;
  final bool status;
  final int deadline;
  final int createdAt;
  const ProjectDetail({
    required this.id,
    required this.departmentId,
    required this.name,
    required this.descriptions,
    required this.percentage,
    required this.status,
    required this.deadline,
    required this.createdAt,
  });

  ProjectDetail copyWith({
    int? id,
    int? departmentId,
    String? name,
    String? descriptions,
    double? percentage,
    bool? status,
    int? deadline,
    int? createdAt,
  }) {
    return ProjectDetail(
      id: id ?? this.id,
      departmentId: departmentId ?? this.departmentId,
      name: name ?? this.name,
      descriptions: descriptions ?? this.descriptions,
      percentage: percentage ?? this.percentage,
      status: status ?? this.status,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'departmentId': departmentId,
      'name': name,
      'descriptions': descriptions,
      'percentage': percentage,
      'status': status ? 1 : 0,
      // 'deadline': deadline,
      // 'createdAt': createdAt,
    };
  }

  factory ProjectDetail.fromMap(Map<String, dynamic> map) {
    return ProjectDetail(
      id: map['id']?.toInt() ?? 0,
      departmentId: map['departmentId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      descriptions: map['descriptions'] ?? '',
      percentage: map['percentage']?.toDouble() ?? 0.0,
      status: map['status'] ?? false,
      deadline: map['deadline']?.toInt() ?? 0,
      createdAt: map['createdAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectDetail.fromJson(String source) =>
      ProjectDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProjectDetail(id: $id, departmentId: $departmentId, name: $name, descriptions: $descriptions, percentage: $percentage, status: $status, deadline: $deadline, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectDetail &&
        other.id == id &&
        other.departmentId == departmentId &&
        other.name == name &&
        other.descriptions == descriptions &&
        other.percentage == percentage &&
        other.status == status &&
        other.deadline == deadline &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        departmentId.hashCode ^
        name.hashCode ^
        descriptions.hashCode ^
        percentage.hashCode ^
        status.hashCode ^
        deadline.hashCode ^
        createdAt.hashCode;
  }
}
