import 'package:api_client/api_client.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projects/colors/colors.dart';
import 'package:projects/messages/bloc/message_bloc.dart';
import 'package:projects/routes/routes.dart';
import 'package:projects/typography/text_styles.dart';

import '../../app/bloc/app_bloc.dart';

class ProjectCard extends StatelessWidget {
  final int count;
  final Project project;
  const ProjectCard({
    Key? key,
    required this.project,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user =
    //     context.select<AppBloc, AppState>((AppBloc bloc) => bloc.state);
    return Card(
      child: InkWell(
        onTap: () {
          // context.read<MessageBloc>().add(MessageLoad(
          //     projectId: project.id,
          //     projectName: project.name,
          //     userId: user.user!.id));
          context
              .flow<RouteState>()
              .update((state) => RouteState.projectsDetails);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(count < 10 ? "#0${count + 1}" : "${count + 1} ",
                          style: MondayTextStyle.bodyXSmall),
                      Column(
                        children: [
                          Text(
                              DateFormat.yMMMMEEEEd().format(project.createdAt),
                              style: MondayTextStyle.bodyXSmall.copyWith(
                                  color: project.status
                                      ? MondayColors.greenPrimary
                                      : MondayColors.red50)),
                          Text(DateFormat.yMMMMEEEEd().format(project.deadline),
                              style: MondayTextStyle.bodyXSmall.copyWith(
                                  color: project.status
                                      ? MondayColors.greenPrimary
                                      : MondayColors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  trailing: Text(
                    "${project.percentage}%",
                    style: MondayTextStyle.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: project.status
                          ? MondayColors.greenPrimary
                          : MondayColors.red50,
                    ),
                  ),
                  leading: project.status
                      ? const Icon(Icons.check,
                          color: MondayColors.greenPrimary)
                      : const Icon(Icons.close, color: MondayColors.red50),
                  title: Text(project.name, style: MondayTextStyle.body),
                  subtitle: Text(project.descriptions,
                      style: MondayTextStyle.bodyXSmall),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
