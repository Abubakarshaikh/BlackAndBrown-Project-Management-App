import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'project_details_event.dart';
part 'project_details_state.dart';

class ProjectDetailsBloc
    extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  final ProjectDetailProvider _projectDetailProvider;
  ProjectDetailsBloc(this._projectDetailProvider)
      : super(const ProjectDetailsState()) {
    on<ProjectUpdated>(_onProjectUpdated);
  }

  void onLoadProject(ProjectLoad event, Emitter<ProjectDetailsState> state) {
    emit(ProjectDetailsState(
        project: event.project, status: ProjectStatus.success));
  }

  void _onProjectUpdated(
      ProjectUpdated event, Emitter<ProjectDetailsState> emit) {
    _projectDetailProvider.update(state.project!.toMap(), state.project!.id);
  }
}
