import 'package:flutter/material.dart';
import 'package:projects/colors/colors.dart';
import 'package:projects/typography/text_styles.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: LoginPage());

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LoginForm(),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 12),
                  //   child: Text(
                  //     "Contact us, we're here 24/7",
                  //     style: MondayTextStyle.bodyXSmall
                  //         .copyWith(color: MondayColors.blue50),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
