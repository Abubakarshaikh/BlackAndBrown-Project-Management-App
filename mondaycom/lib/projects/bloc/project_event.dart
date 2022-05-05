part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class ProjectLoad extends ProjectEvent {
  final int id;
  const ProjectLoad({required this.id});

  @override
  List<Object> get props => [id];
}
