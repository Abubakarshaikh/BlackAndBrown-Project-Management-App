part of 'project_bloc.dart';

enum ProjectStatus { initial, loading, success, failure }

class ProjectState extends Equatable {
  const ProjectState(
      {this.projects = const [], this.status = ProjectStatus.initial});
  final List<Project> projects;
  final ProjectStatus status;

  @override
  List<Object> get props => [projects, status];
}
