part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object?> get props => [];
}

class AddDepartments extends AddEvent {
  const AddDepartments();

  @override
  List<Object?> get props => [];
}

class AddTitle extends AddEvent {
  final String title;
  const AddTitle({required this.title});

  @override
  List<Object> get props => [title];
}

class AddDesc extends AddEvent {
  final String desc;
  const AddDesc({required this.desc});

  @override
  List<Object> get props => [desc];
}

class AddDateTime extends AddEvent {
  final DateTime? dateTime;
  const AddDateTime({required this.dateTime});

  @override
  List<Object?> get props => [dateTime];
}

class AddSelectedDepartment extends AddEvent {
  final int departmentId;
  const AddSelectedDepartment({required this.departmentId});

  @override
  List<Object> get props => [departmentId];
}

class AddSave extends AddEvent {
  const AddSave();
}
