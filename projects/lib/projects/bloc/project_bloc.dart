import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectProvider _projectProvider;
  ProjectBloc(this._projectProvider) : super(const ProjectState()) {
    on<ProjectLoad>(_onProjectLoad);
    on<ProjectRefreshIndicator>(_onProjectRefreshIndicator);
  }

  Future<void> _onProjectLoad(
      ProjectLoad event, Emitter<ProjectState> emit) async {
    try {
      emit(const ProjectState(status: ProjectStatus.loading));
      final fromRepo = await _projectProvider.getAll(event.id);
      emit(ProjectState(
          projects: fromRepo,
          departmentId: event.id,
          status: ProjectStatus.success));
    } catch (_) {
      emit(const ProjectState(status: ProjectStatus.failure));
    }
  }

  Future<void> _onProjectRefreshIndicator(
      ProjectRefreshIndicator event, Emitter<ProjectState> emit) async {
    try {
      final fromRepo = await _projectProvider.getAll(state.departmentId);
      emit(state.copyWith(projects: fromRepo));
    } catch (_) {
      emit(state);
    }
  }
}
