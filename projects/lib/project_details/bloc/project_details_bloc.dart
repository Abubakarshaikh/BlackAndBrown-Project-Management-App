import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'project_details_event.dart';
part 'project_details_state.dart';

class ProjectDetailsBloc
    extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  final ProjectDetailProvider _detailProvider;
  ProjectDetailsBloc(this._detailProvider)
      : super(const ProjectDetailsState()) {
    on<ProjectDetailLoad>(onLoadProject);
    on<ProjectDetailUpdated>(onUpdateProjectDetails);
    on<ProjectDetailSubmit>(_onProjectDetailSubmit);
  }

  void onLoadProject(
      ProjectDetailLoad event, Emitter<ProjectDetailsState> emit) async {
    try {
      final ProjectDetail data = await _detailProvider.readSingle(event.id);

      emit(ProjectDetailsState(project: data, status: ProjectStatus.success));
    } catch (_) {
      emit(const ProjectDetailsState(status: ProjectStatus.failure));
    }
  }

  void onUpdateProjectDetails(
      ProjectDetailUpdated event, Emitter<ProjectDetailsState> emit) async {
    emit(ProjectDetailsState(
        project: event.projectDetail.copyWith(
          status: event.projectDetail.percentage == 1 ? true : false,
        ),
        status: ProjectStatus.success));
  }

  Future<void> _onProjectDetailSubmit(
      ProjectDetailSubmit event, Emitter<ProjectDetailsState> emit) async {
    try {
      await _detailProvider.update(state.project!.toJson(), state.project!.id);
    } catch (e) {
      log("Error :$e");
    }
  }
}
