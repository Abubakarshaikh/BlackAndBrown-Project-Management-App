import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projects/project_details/bloc/project_details_bloc.dart';
import '../../colors/colors.dart';
import '../../typography/text_styles.dart';

class ProjectDetailsPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: ProjectDetailsPage());

  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '';
    Color mycolor = Colors.red;
    return BlocBuilder<ProjectDetailsBloc, ProjectDetailsState>(
      builder: (_, state) {
        switch (state.status) {
          case ProjectStatus.initial:
          case ProjectStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ProjectStatus.success:
            if (state.project!.percentage > 0.9) {
              mycolor = Colors.green;
            } else if (state.project!.percentage > 0.5) {
              mycolor = Colors.yellow;
            } else if (state.project!.percentage > 0.3) {
              mycolor = Colors.indigo;
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text("Software Deployment"),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Admin to Department Task",
                                style: MondayTextStyle.bodySmall
                                    .copyWith(fontWeight: FontWeight.w600)),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Text("${state.project!.descriptions}"),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Department to Admin Task Progress Details",
                                style: MondayTextStyle.bodySmall
                                    .copyWith(fontWeight: FontWeight.w600)),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    enableDrag: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) {
                                      return Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const SizedBox(height: 16.0),
                                              Text("Progress Deatails",
                                                  style:
                                                      MondayTextStyle.headline4,
                                                  textAlign: TextAlign.center),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: TextField(
                                                      autofocus: true,
                                                      style:
                                                          MondayTextStyle.body,
                                                      decoration:
                                                          const InputDecoration(),
                                                      onChanged: (value) {
                                                        text = value;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 16.0),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    context
                                                        .read<
                                                            ProjectDetailsBloc>()
                                                        .add(ProjectDetailUpdated(
                                                            projectDetail: state
                                                                .project!
                                                                .copyWith(
                                                                    descriptions:
                                                                        text)));
                                                    text = '';
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Update")),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(state.project!.descriptions),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text("Task Bar",
                                  style: MondayTextStyle.body
                                      .copyWith(fontWeight: FontWeight.w600)),
                            ),
                            LinearPercentIndicator(
                              progressColor: mycolor,
                              padding: const EdgeInsets.all(0),
                              barRadius: const Radius.circular(12.0),
                              lineHeight: 16.0,
                              percent: state.project!.percentage,
                              center: Text(
                                  "${(state.project!.percentage * 100).toStringAsFixed(0)}%",
                                  style: MondayTextStyle.bodyXSmall),
                              backgroundColor: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Slider(
                          inactiveColor: MondayColors.black2,
                          divisions: 10,
                          min: .0,
                          max: 1,
                          value: state.project!.percentage.toDouble(),
                          onChanged: (value) {
                            context.read<ProjectDetailsBloc>().add(
                                ProjectDetailUpdated(
                                    projectDetail: state.project!
                                        .copyWith(percentage: value)));
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProjectDetailsBloc>()
                              .add(const ProjectDetailSubmit());
                          Navigator.pop(context);
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case ProjectStatus.failure:
          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
