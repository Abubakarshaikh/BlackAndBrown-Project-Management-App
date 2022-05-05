import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/app/bloc/app_bloc.dart';
import 'package:mondaycom/login/bloc/login_bloc.dart';
import 'package:mondaycom/routes/routes.dart';

import '../../app/view/app.dart';
import '../../colors/colors.dart';
import '../../typography/font_weights.dart';
import '../../typography/text_styles.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text("Work the way that works for you",
                style: MondayTextStyle.bodySmall),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child:
                      Text("Log in by email", style: MondayTextStyle.bodySmall),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const _InputEmail(),
            const SizedBox(height: 18),
            const _InputPassword(),
            const SizedBox(height: 18),
            const _SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      cursorColor: MondayColors.blue50,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 12, right: 0, top: 0, bottom: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: MondayColors.black2,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.shade800,
              width: 1.1,
            )),
        hintText: 'password',
        hintStyle: MondayTextStyle.bodySmall.copyWith(
          fontWeight: MondayFontWeight.extraBold,
          color: MondayColors.black2,
        ),
      ),
      onChanged: (newValue) =>
          context.read<LoginBloc>().add(LoginPassword(password: newValue)),
    );
  }
}

class _InputEmail extends StatelessWidget {
  const _InputEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: MondayColors.blue50,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 12, right: 0, top: 0, bottom: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: MondayColors.black2,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blue.shade800,
            width: 1.1,
          ),
        ),
        hintText: 'name@workemail.com',
        hintStyle: MondayTextStyle.bodySmall.copyWith(
          fontWeight: MondayFontWeight.extraBold,
          color: MondayColors.black2,
        ),
      ),
      onChanged: (newValue) =>
          context.read<LoginBloc>().add(LoginEmail(email: newValue)),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocConsumer<LoginBloc, LoginState>(
          listener: (context, listner) {
            if (listner.status == loginStatus.success) {
              context.flow<RouteState>().update((state) => RouteState.startup);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case loginStatus.initial:
                return ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(const LoginSubmit());
                  },
                  child: const Text("Next"),
                );
              case loginStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case loginStatus.success:
                return const Center(child: CircularProgressIndicator());
              default:
                return const Text("Something wetn wrong");
            }
          },
        ),
      ],
    );
  }
}
