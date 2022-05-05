import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_client/api_client.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageProvider _messageProvider;
  MessageBloc(this._messageProvider) : super(const MessageState()) {
    on<MessageLoad>(_onMessageLoad);
    on<MessageSubmitted>(_onSubmitted);
    on<MessageRefreshIndicator>(_onMessageRefreshIndicator);
  }

  Future<void> _onMessageLoad(
      MessageLoad event, Emitter<MessageState> emit) async {
    try {
      emit(const MessageState(status: MessageStatus.loading));
      final fromRepo = await _messageProvider.getAllMessages(event.projectId);
      emit(
        MessageState(
          messages: fromRepo.reversed.toList(),
          projectId: event.projectId,
          projectName: event.projectName,
          userId: event.userId,
          status: MessageStatus.success,
        ),
      );
    } catch (_) {
      if (state.messages.isEmpty) {
        emit(MessageState(
          projectId: event.projectId,
          projectName: event.projectName,
          status: MessageStatus.success,
          userId: event.userId,
        ));
      } else {
        emit(const MessageState(status: MessageStatus.failure));
      }
    }
  }

  Future<void> _onSubmitted(
      MessageSubmitted event, Emitter<MessageState> emit) async {
    try {
      await _messageProvider.saveMessage(
        Message(
          id: 0,
          projectId: state.projectId,
          message: event.message,
          senderId: state.userId,
        ),
      );

      if (state.messages.isEmpty) {
        final fromRepo = await _messageProvider.getAllMessages(state.projectId);
        emit(MessageState(
          messages: fromRepo,
          projectId: state.projectId,
          projectName: state.projectName,
          status: MessageStatus.success,
          userId: state.userId,
        ));
      } else {
        emit(state.copyWith(
            messages: [
              ...state.messages.reversed.toList(),
              state.messages.last
                  .copyWith(message: event.message, senderId: state.userId)
            ].reversed.toList(),
            status: MessageStatus.success));
      }
    } catch (_) {
      emit(const MessageState(status: MessageStatus.failure));
    }
  }

  Future<void> _onMessageRefreshIndicator(
      MessageRefreshIndicator event, Emitter<MessageState> emit) async {
    try {
      final fromRepo = await _messageProvider.getAllMessages(state.projectId);
      emit(state.copyWith(messages: fromRepo.reversed.toList()));
    } catch (e) {
      emit(state);
    }
  }
}

