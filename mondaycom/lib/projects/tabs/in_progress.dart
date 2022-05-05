import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/projects/bloc/project_bloc.dart';

import '../widgets/project_thumbnail.dart';

class InProgress extends StatelessWidget {
  final List<Project> projectModels;
  const InProgress({Key? key, required this.projectModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: projectModels.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    itemCount: projectModels.length,
                    itemBuilder: (context, index) {
                      return ProjectThumbnail(
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
