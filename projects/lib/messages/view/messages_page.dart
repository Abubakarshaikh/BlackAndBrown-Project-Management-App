import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/messages/bloc/message_bloc.dart';
import '../widgets/input_text_box.dart';
import '../widgets/message_tile.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: MessagePage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            switch (state.status) {
              case MessageStatus.initial:
              case MessageStatus.loading:
              case MessageStatus.success:
                return Text(state.projectName);
              default:
                return const Text("Something went wrong");
            }
          },
        ),
      ),
      body: Column(
        children: [
          MessagesListTile(),
          SizedBox(height: 12),
          InputTextBox(),
          SizedBox(height: 9),
        ],
      ),
    );
  }
}

class MessagesListTile extends StatelessWidget {
  const MessagesListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        switch (state.status) {
          case MessageStatus.initial:
          case MessageStatus.loading:
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case MessageStatus.success:
            return Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<MessageBloc>()
                      .add(const MessageRefreshIndicator());
                },
                child: ListView.builder(
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return MessageTile(message: state.messages[index]);
                  },
                ),
              ),
            );
          default:
            return const Expanded(child: Text("Something went wrong"));
        }
      },
    );
  }
}
