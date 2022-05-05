part of 'add_bloc.dart';

enum EditAddStatus { initial, loading, loadingComplete, success, failure}

class AddState {
  final EditAddStatus stateStatus;
  final int? departmentId;
  final List<Department>? departments;
  final String? name;
  final String? descriptions;
  final DateTime? deadline;
  final bool status;
  const AddState({
    this.stateStatus = EditAddStatus.initial,
    this.departmentId,
    this.departments,
    this.name,
    this.descriptions,
    this.deadline,
    this.status = false,
  });

  AddState copyWith({
    EditAddStatus? stateStatus,
    int? departmentId,
    List<Department>? departments,
    String? name,
    String? descriptions,
    DateTime? deadline,
    bool? status,
  }) {
    return AddState(
      stateStatus: stateStatus ?? this.stateStatus,
      departmentId: departmentId ?? this.departmentId,
      departments: departments ?? this.departments,
      name: name ?? this.name,
      descriptions: descriptions ?? this.descriptions,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'departmentId': departmentId,
      'name': name,
      'descriptions': descriptions,
      'deadline': deadline?.millisecondsSinceEpoch,
      'status': status ? 1 : 0,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AddState(stateStatus: $stateStatus, departmentId: $departmentId, departments: $departments, name: $name, descriptions: $descriptions, deadline: $deadline, status: $status)';
  }
}
