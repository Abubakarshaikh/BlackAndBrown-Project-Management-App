import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../app/bloc/app_bloc.dart';
import '../../colors/colors.dart';
import '../../typography/text_styles.dart';

class MessageTile extends StatelessWidget {
  final Message message;
  const MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state.user != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Row(
              mainAxisAlignment: message.senderId == state.user!.id
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message.senderId == state.user!.id
                            ? MondayColors.black
                            : MondayColors.red50,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Text(
                            message.message,
                            style: MondayTextStyle.bodySmall.copyWith(
                              color: MondayColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      DateFormat.MEd().format(message.createdAt!),
                      style: MondayTextStyle.bodySmall.copyWith(
                        color: MondayColors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text("Something went wrong"),
        );
      },
    );
  }
}
