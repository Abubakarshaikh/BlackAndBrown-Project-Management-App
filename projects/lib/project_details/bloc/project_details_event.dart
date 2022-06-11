part of 'project_details_bloc.dart';

abstract class ProjectDetailsEvent extends Equatable {
  const ProjectDetailsEvent();

  @override
  List<Object> get props => [];
}

class ProjectDetailLoad extends ProjectDetailsEvent {
  final int id;
  const ProjectDetailLoad({required this.id});

  @override
  List<Object> get props => [id];
}

class ProjectDetailUpdated extends ProjectDetailsEvent {
  final ProjectDetail projectDetail;
  const ProjectDetailUpdated({required this.projectDetail});

  @override
  List<Object> get props => [projectDetail];
}

class ProjectDetailSubmit extends ProjectDetailsEvent {
  const ProjectDetailSubmit();
}
