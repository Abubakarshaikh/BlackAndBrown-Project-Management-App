part of 'project_details_bloc.dart';

abstract class ProjectDetailsEvent extends Equatable {
  const ProjectDetailsEvent();

  @override
  List<Object> get props => [];
}

class ProjectLoad extends ProjectDetailsEvent {
  final Project project;
  const ProjectLoad({required this.project});

  @override
  List<Object> get props => [project];
}
