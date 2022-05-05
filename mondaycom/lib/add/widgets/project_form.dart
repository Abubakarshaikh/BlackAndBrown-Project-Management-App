import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mondaycom/add/add.dart';
import '../../colors/colors.dart';
import '../../typography/text_styles.dart';
import 'package:intl/intl.dart';

class ProjectForm extends StatelessWidget {
  const ProjectForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        children: const [
          _EnterTitle(),
          SizedBox(height: 10),
          _AddDetails(),
          SizedBox(height: 10),
          _AddDateTime(),
          SizedBox(height: 10),
          _SelectDepartment(),
          SizedBox(height: 10),
          _AddAttachments(),
        ],
      ),
    );
  }
}

class _EnterTitle extends StatelessWidget {
  const _EnterTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return TextField(
          style: MondayTextStyle.headline4Soft,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter title",
            hintStyle: MondayTextStyle.headline4Soft
                .copyWith(color: MondayColors.grey1),
          ),
          onChanged: (newValue) =>
              context.read<AddBloc>().add(AddTitle(title: newValue)),
        );
      },
    );
  }
}

class _AddDetails extends StatelessWidget {
  const _AddDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(builder: (context, state) {
      return TextField(
        style: MondayTextStyle.body,
        decoration: InputDecoration(
          icon: const Icon(Icons.sort, color: MondayColors.grey1),
          border: InputBorder.none,
          hintText: "Add details",
          hintStyle:
              MondayTextStyle.bodySmall.copyWith(color: MondayColors.grey1),
        ),
        onChanged: (newValue) =>
            context.read<AddBloc>().add(AddDesc(desc: newValue)),
      );
    });
  }
}

class _AddDateTime extends StatelessWidget {
  const _AddDateTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(builder: (context, state) {
      return ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 0,
        leading: const Icon(Icons.event_available, color: MondayColors.grey1),
        title: Text(
          state.deadline == null
              ? "Deadline"
              : DateFormat.yMd().format(state.deadline!),
          style: MondayTextStyle.bodySmall.copyWith(color: MondayColors.grey1),
        ),
        onTap: () => _datePicker(context),
      );
    });
  }

  Future<void> _datePicker(BuildContext context) async {
    final fromWidget = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    context.read<AddBloc>().add(AddDateTime(dateTime: fromWidget));
  }
}

class _SelectDepartment extends StatelessWidget {
  const _SelectDepartment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddBloc>().add(const AddDepartments());
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        switch (state.stateStatus) {
          case EditAddStatus.loading:
            return const Align(
              alignment: Alignment.centerLeft,
              child: CircularProgressIndicator(),
            );
          case EditAddStatus.loadingComplete:
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              horizontalTitleGap: 0,
              leading: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: MondayColors.grey1),
              title: DropdownButton(
                icon: const Opacity(opacity: 0),
                underline: const Opacity(opacity: 0),
                hint: Text(
                  "Select Department",
                  style: MondayTextStyle.bodySmall
                      .copyWith(color: MondayColors.grey1),
                ),
                value: state.departmentId,
                items: state.departments!.map((department) {
                  return DropdownMenuItem(
                    child: Text(
                      department.name,
                      style: MondayTextStyle.bodySmall.copyWith(
                        color: MondayColors.grey1,
                      ),
                    ),
                    value: department.id,
                  );
                }).toList(),
                onChanged: (int? newValue) => context
                    .read<AddBloc>()
                    .add(AddSelectedDepartment(departmentId: newValue!)),
              ),
            );
          default:
            return const Text("Something went wrong");
        }
      },
    );
  }
}

class _AddAttachments extends StatelessWidget {
  const _AddAttachments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          horizontalTitleGap: 0,
          leading: const Icon(Icons.attach_file, color: MondayColors.grey1),
          title: Text(
            "Add attachments",
            style: MondayTextStyle.bodySmall.copyWith(
              color: MondayColors.grey1,
            ),
          ),
        );
      },
    );
  }
}
