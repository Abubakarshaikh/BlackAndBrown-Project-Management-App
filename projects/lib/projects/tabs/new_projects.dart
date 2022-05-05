import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/project_bloc.dart';
import '../widgets/project_card.dart';

class NewProject extends StatelessWidget {
  final List<Project> projectModels;

  const NewProject(
      {Key? key, required this.projectModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: projectModels.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<ProjectBloc>()
                        .add(const ProjectRefreshIndicator());
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    itemCount: projectModels.length,
                    itemBuilder: (context, index) {
                      return ProjectCard(
                          project: projectModels[index], count: index);
                    },
                  ),
                )
              : const Center(child: Text("Empty")),
        ),
      ],
    );
  }
}
