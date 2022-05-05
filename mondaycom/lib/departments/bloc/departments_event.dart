part of 'departments_bloc.dart';

abstract class DepartmentEvent extends Equatable {
  const DepartmentEvent();

  @override
  List<Object> get props => [];
}

class DepartmentLoad extends DepartmentEvent {
  const DepartmentLoad();
}

class DepartmentRefreshIndicator extends DepartmentEvent {
  const DepartmentRefreshIndicator();
}
