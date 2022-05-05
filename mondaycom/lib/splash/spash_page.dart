import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../app/bloc/app_bloc.dart';
import '../colors/colors.dart';
import '../typography/text_styles.dart';

class SplashPage extends StatefulWidget {
  static Page page() => const MaterialPage<void>(child: SplashPage());

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<AppBloc>().add(const AppLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.directions_run_rounded,
              color: Colors.black, size: 80),
              const SizedBox(height: 12),
          Text("Black and Brown", style: MondayTextStyle.headline4),
          const SizedBox(height: 96),
          const Center(
            child: CircularProgressIndicator(
              color: MondayColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
