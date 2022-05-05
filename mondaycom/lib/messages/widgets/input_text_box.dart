import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/colors/colors.dart';
import 'package:mondaycom/messages/bloc/message_bloc.dart';
import 'package:mondaycom/typography/text_styles.dart';

class InputTextBox extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  InputTextBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = "";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (newValue) {
                message = newValue;
              },
              style: MondayTextStyle.bodySmall,
              decoration: InputDecoration(
                hintText: 'Message',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: MondayColors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(
                    color: MondayColors.blue50,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<MessageBloc>()
                  .add(MessageSubmitted(message: message));
              controller.text = '';
            },
            padding: const EdgeInsets.only(left: 12),
            icon: const Icon(Icons.send, color: MondayColors.red50, size: 36),
          ),
        ],
      ),
    );
  }
}
