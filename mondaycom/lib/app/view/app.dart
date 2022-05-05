import 'package:api_client/api_client.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/add/add.dart';
import 'package:mondaycom/app/bloc/app_bloc.dart';
import 'package:mondaycom/departments/bloc/departments_bloc.dart';
import 'package:mondaycom/login/bloc/login_bloc.dart';
import 'package:mondaycom/messages/bloc/message_bloc.dart';
import 'package:mondaycom/projects/projects.dart';
import 'package:mondaycom/routes/routes.dart';
import 'package:mondaycom/theme/theme.dart';

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
        BlocProvider(
            create: (_) => DepartmentBloc(DepartmentProvider())
              ..add(const DepartmentLoad())),
        BlocProvider(create: (_) => ProjectBloc(ProjectProvider())),
        BlocProvider(
            create: (_) => AddBloc(AddProvider(), DepartmentProvider())),
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
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return FlowBuilder(
        state: state.status,
        onGeneratePages: onGenerateAppViewPages,
      );
    });
  }
}
