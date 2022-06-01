import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../colors/colors.dart';
import '../../typography/text_styles.dart';

class ProjectDetailsPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: ProjectDetailsPage());

  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.edit),
          )
        ],
        title: const Text("Software Deployment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Department to Admin Task Progress Details",
                        style: MondayTextStyle.bodySmall
                            .copyWith(fontWeight: FontWeight.w600)),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text("Progress Bar",
                          style: MondayTextStyle.body
                              .copyWith(fontWeight: FontWeight.w600)),
                    ),
                    LinearPercentIndicator(
                      progressColor: MondayColors.red50,
                      padding: const EdgeInsets.all(0),
                      barRadius: const Radius.circular(12.0),
                      lineHeight: 16.0,
                      percent: 0.5,
                      center: Text("90.0%", style: MondayTextStyle.bodyXSmall),
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
                  min: 0,
                  max: 100,
                  value: 10,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
