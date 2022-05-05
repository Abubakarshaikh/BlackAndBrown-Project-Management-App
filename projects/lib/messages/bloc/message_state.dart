part of 'message_bloc.dart';

enum MessageStatus { initial, loading, success, failure }

class MessageState extends Equatable {
  final MessageStatus status;
  final List<Message> messages;
  final String projectName;
  final int projectId;
  final int userId;
  const MessageState({
    this.status = MessageStatus.initial,
    this.messages = const [],
    this.projectName = '',
    this.projectId = 0,
    this.userId = 0,
  });

  MessageState copyWith({
    MessageStatus? status,
    List<Message>? messages,
    String? projectName,
    int? projectId,
    int? userId,
  }) {
    return MessageState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      projectName: projectName ?? this.projectName,
      projectId: projectId ?? this.projectId,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object> get props {
    return [status, messages, projectName, projectId, userId];
  }
}
