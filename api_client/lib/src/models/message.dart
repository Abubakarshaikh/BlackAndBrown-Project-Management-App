import 'dart:convert';

class Message {
  final int id;
  final int projectId;
  final String message;
  final int senderId;
  final DateTime? createdAt;
  const Message({
    required this.id,
    required this.projectId,
    required this.message,
    required this.senderId,
    this.createdAt,
  });

  Message copyWith({
    int? id,
    int? projectId,
    String? message,
    int? senderId,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      message: message ?? this.message,
      senderId: senderId ?? this.senderId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': projectId,
      'message': message,
      'senderId': senderId,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id']?.toInt() ?? 0,
      projectId: map['projectId']?.toInt() ?? 0,
      message: map['message'] ?? '',
      senderId: map['senderId']?.toInt() ?? 0,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] * 1000)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(id: $id, projectId: $projectId, message: $message, senderId: $senderId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.projectId == projectId &&
        other.message == message &&
        other.senderId == senderId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        projectId.hashCode ^
        message.hashCode ^
        senderId.hashCode ^
        createdAt.hashCode;
  }
}
