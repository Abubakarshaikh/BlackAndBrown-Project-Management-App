part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
  @override
  List<Object?> get props => [];
}

class MessageLoad extends MessageEvent {
  final int projectId;
  final int userId;
  final String projectName;
  const MessageLoad(
      {required this.projectId,
      required this.projectName,
      required this.userId});

  @override
  List<Object?> get props => [projectId, projectName, userId];
}

class MessageSubmitted extends MessageEvent {
  final String message;
  const MessageSubmitted({required this.message});

  @override
  List<Object?> get props => [message];
}


class MessageRefreshIndicator extends MessageEvent {
  const MessageRefreshIndicator();
}
