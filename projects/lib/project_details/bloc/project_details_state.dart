part of 'project_details_bloc.dart';

enum ProjectStatus { initial, loading, success, failure }

class ProjectDetailsState extends Equatable {
  const ProjectDetailsState(
      {this.project, this.status = ProjectStatus.initial});
  final ProjectDetail? project;
  final ProjectStatus status;

  @override
  List<Object?> get props => [project, status];
}
