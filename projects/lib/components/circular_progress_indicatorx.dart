import 'package:flutter/material.dart';

import '../colors/colors.dart';

class CircularProgressIndicatorx extends StatelessWidget {
  const CircularProgressIndicatorx({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: MondayColors.red50,
            backgroundColor: MondayColors.red50,
          ),
        ),
      ),
    );
  }
}
