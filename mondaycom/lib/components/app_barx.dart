import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppBarx extends StatelessWidget {
  final String title;
  final bool isBackbutton;
  final Function()? onTap;
  const AppBarx({
    Key? key,
    required this.title,
    this.isBackbutton = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 24),
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(
        width: double.infinity,
        height: 100,
      ),
      decoration: const BoxDecoration(
        color: MondayColors.red50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              isBackbutton
                  ? InkWell(
                      onTap: onTap,
                      child: const Icon(Icons.arrow_back_ios_rounded,
                          color: MondayColors.white),
                    )
                  : const Opacity(opacity: 0),
              const SizedBox(width: 24),
              Text(
                title,
                style: theme.headline4!.copyWith(
                  fontSize: 24,
                  color: MondayColors.white,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
