import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/colors/colors.dart';
import 'package:projects/projects/projects.dart';
import 'package:projects/projects/tabs/tabs.dart';
import 'package:projects/typography/typography.dart';

class ProjectsPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: ProjectsPage());

  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = context.select((ProjectBloc bloc) => bloc.state);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              switch (state.status) {
                case ProjectStatus.initial:
                case ProjectStatus.loading:
                  return const Opacity(opacity: 0);
                case ProjectStatus.success:
                  return Text(state.projects.last.departmentName);
                default:
                  return const Text("Something went wrong");
              }
            },
          ),
          bottom: TabBar(
            labelStyle: MondayTextStyle.bodyXSmall.copyWith(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: MondayColors.white,
            indicatorWeight: 1.5,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                  text:
                      "New Assign(${projects.projects.where((project) => project.percentage < 1).length})"),
              Tab(
                  text:
                      "In Progress(${projects.projects.where((project) => project.percentage > 1 && project.percentage < 99).length})"),
              Tab(
                  text:
                      "Resolved(${projects.projects.where((project) => project.percentage > 99).length})"),
            ],
          ),
        ),
        body: const ProjectListTile(),
      ),
    );
  }
}

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        switch (state.status) {
          case ProjectStatus.initial:
          case ProjectStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProjectStatus.success:
            return TabBarView(
              children: [
                NewProject(
                    projectModels: state.projects
                        .where((project) => project.percentage < 1)
                        .toList()
                        .reversed
                        .toList()),
                InProgress(
                    projectModels: state.projects
                        .where((project) =>
                            project.percentage > 1 && project.percentage < 99)
                        .toList()
                        .reversed
                        .toList()),
                ResolvedProjects(
                    projectModels: state.projects
                        .where((project) => project.percentage > 99)
                        .toList()
                        .reversed
                        .toList()),
              ],
            );
          default:
            return const Center(
              child: Text("Something went wrong"),
            );
        }
      },
    );
  }
}
