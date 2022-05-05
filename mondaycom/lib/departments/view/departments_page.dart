import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/add/add.dart';
import 'package:mondaycom/colors/colors.dart';
import 'package:mondaycom/departments/bloc/departments_bloc.dart';
import '../../routes/routes_state.dart';
import '../widgets/widgets.dart';

class DepartmentsPage extends StatefulWidget {
  static Page page() => const MaterialPage<void>(child: DepartmentsPage());
  const DepartmentsPage({Key? key}) : super(key: key);

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  @override
  void initState() {
    _onRef();
    super.initState();
  }

  Future<void> _onRef() async {
    context.read<DepartmentBloc>().add(const DepartmentRefreshIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Departments")),
      body: BlocConsumer<DepartmentBloc, DepartmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.status) {
            case DepartmentStatus.initial:
            case DepartmentStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DepartmentStatus.success:
              return RefreshIndicator(
                onRefresh: _onRef,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 4),
                  itemCount: state.departments.length,
                  itemBuilder: (context, index) {
                    return DepartmentTile(
                        department: state.departments[index], index: index);
                  },
                ),
              );
            default:
              return const Center(
                child: Text("Something went wrong!"),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AddBloc>().add(const AddDepartments());
          context
              .flow<RouteState>()
              .update((state) => RouteState.createProject);
        },
        child: const Icon(Icons.add, color: MondayColors.white),
      ),
    );
  }
}
