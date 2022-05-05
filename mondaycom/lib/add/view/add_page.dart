import 'package:api_client/api_client.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/routes/routes.dart';
import '../../departments/bloc/departments_bloc.dart';
import '../bloc/add_bloc.dart';
import '../widgets/project_form.dart';

class AddPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: AddPage());
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Project")),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const ProjectForm(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  _SubmitButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddBloc>().add(const AddDepartments());
    return BlocConsumer<AddBloc, AddState>(
      listener: (context, listner) {
        if (listner.stateStatus == EditAddStatus.success) {
          context
              .flow<RouteState>()
              .update((state) => RouteState.authenticated);
        } else if (listner.stateStatus == EditAddStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Some thing went wrong"),
          ));
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          child: const Text("Save"),
          onPressed: state.deadline == null &&
                  state.descriptions == null &&
                  state.departmentId == null
              ? null
              : () {
                  context.read<AddBloc>().add(const AddSave());
                },
        );
      },
    );
  }
}
