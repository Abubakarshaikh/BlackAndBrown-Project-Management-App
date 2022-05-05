import 'package:api_client/api_client.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/projects/bloc/project_bloc.dart';
import 'package:mondaycom/routes/routes.dart';
import 'package:mondaycom/typography/text_styles.dart';

class DepartmentTile extends StatelessWidget {
  final Department department;
  final int index;
  const DepartmentTile({
    Key? key,
    required this.department,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, listner) {},
      child: ListTile(
        leading: Text("${index + 1}. ", style: MondayTextStyle.body),
        onTap: department.totalProjects != 0
            ? () {
                context.read<ProjectBloc>().add(ProjectLoad(id: department.id));
                context
                    .flow<RouteState>()
                    .update((state) => RouteState.projects);
              }
            : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("${department.name} have no Projects.")),
                );
              },
        title: Text(department.name,
            style: MondayTextStyle.body.copyWith(
              fontSize: 18,
            )),
        trailing: Text(
          "${department.totalProjects}/${department.completedProjects}",
          style: MondayTextStyle.body.copyWith(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
