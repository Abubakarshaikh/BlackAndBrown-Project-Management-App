import 'package:api_client/api_client.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/app/bloc/app_bloc.dart';
import 'package:projects/login/bloc/login_bloc.dart';
import 'package:projects/messages/bloc/message_bloc.dart';
import 'package:projects/project_details/bloc/project_details_bloc.dart';
import 'package:projects/projects/projects.dart';
import 'package:projects/routes/routes_state.dart';
import 'package:projects/theme/theme.dart';

import '../../routes/on_generate_app_view_pages.dart';

class App extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: App());

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AppBloc(UserProvider())..add(const AppLoad())),
        BlocProvider(
          create: (_) => LoginBloc(AuthProvider(), UserProvider())
            ..add(const LoginToken()),
        ),
        BlocProvider(
          create: (_) => MessageBloc(MessageProvider()),
        ),
        BlocProvider(create: (_) => ProjectBloc(ProjectProvider())),
        BlocProvider(
            create: (_) => ProjectDetailsBloc(ProjectDetailProvider())),
      ],
      child: MaterialApp(
        theme: MondayComTheme.standard,
        debugShowCheckedModeBanner: false,
        home: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        switch (state.status) {
          case RouteState.authenticated:
            context
                .read<ProjectBloc>()
                .add(ProjectLoad(id: state.user!.departmentId));
            return FlowBuilder(
              state: state.status,
              onGeneratePages: onGenerateAppViewPages,
            );
          default:
            return FlowBuilder(
              state: state.status,
              onGeneratePages: onGenerateAppViewPages,
            );
        }
      },
    );
  }
}
