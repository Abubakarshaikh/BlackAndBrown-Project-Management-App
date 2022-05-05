import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

import '../widgets/project_thumbnail.dart';

class ResolvedProjects extends StatelessWidget {
  final List<Project> projectModels;
  const ResolvedProjects({Key? key, required this.projectModels})
      : super(key: key);

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
