part of 'departments_bloc.dart';

enum DepartmentStatus { initial, loading, success, failure }

class DepartmentState extends Equatable {
  final DepartmentStatus status;
  final List<Department> departments;

  const DepartmentState(
      {this.departments = const [], this.status = DepartmentStatus.initial});
  @override
  List<Object> get props => [departments, status];

  DepartmentState copyWith({
    DepartmentStatus? status,
    List<Department>? departments,
  }) {
    return DepartmentState(
      status: status ?? this.status,
      departments: departments ?? this.departments,
    );
  }
}
