part of 'project_bloc.dart';

enum ProjectStatus { initial, loading, success, failure }

class ProjectState extends Equatable {
  final List<Project> projects;
  final ProjectStatus status;
  final int departmentId;
  const ProjectState(
      {this.projects = const [],
      this.status = ProjectStatus.initial,
      this.departmentId = 0});
  @override
  List<Object> get props => [projects, status, departmentId];

  ProjectState copyWith({
    List<Project>? projects,
    ProjectStatus? status,
    int? departmentId,
  }) {
    return ProjectState(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      departmentId: departmentId ?? this.departmentId,
    );
  }

  @override
  String toString() =>
      'ProjectState(projects: $projects, status: $status, departmentId: $departmentId)';
}
