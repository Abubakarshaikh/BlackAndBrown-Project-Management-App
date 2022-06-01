import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_details_event.dart';
part 'project_details_state.dart';

class ProjectDetailsBloc
    extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  ProjectDetailsBloc() : super(const ProjectDetailsState());

  void onLoadProject(ProjectLoad event, Emitter<ProjectDetailsState> state) {
    emit(ProjectDetailsState(
        project: event.project, status: ProjectStatus.success));
  }

  //   void onLoadProject(ProjectLoad event, Emitter<ProjectDetailsState> state) {
  //   emit(ProjectDetailsState(
  //       project: event.project, status: ProjectStatus.success));
  // }
}
