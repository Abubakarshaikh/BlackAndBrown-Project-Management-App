import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_client/api_client.dart';

import 'dart:convert';
part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final DepartmentProvider departmentProvider;
  final AddProvider _addProvider;
  AddBloc(this._addProvider, this.departmentProvider)
      : super(const AddState()) {
    on<AddTitle>(_onAddTitle);
    on<AddDesc>(_onAddDesc);
    on<AddSelectedDepartment>(_onAddSelectedDepartment);
    on<AddSave>(_onAddSave);
    on<AddDateTime>(_onAddDateTime);
    on<AddDepartments>(_onAddDepartments);
  }

  void _onAddTitle(AddTitle event, Emitter<AddState> emit) {
    try {
      emit(state.copyWith(
          name: event.title, stateStatus: EditAddStatus.loadingComplete));
    } catch (_) {
      emit(state.copyWith(stateStatus: EditAddStatus.failure));
    }
  }

  void _onAddDesc(AddDesc event, Emitter<AddState> emit) {
    try {
      emit(state.copyWith(
          descriptions: event.desc, stateStatus: EditAddStatus.loadingComplete));
    } catch (_) {
      emit(state.copyWith(stateStatus: EditAddStatus.failure));
    }
  }

  void _onAddDateTime(AddDateTime event, Emitter<AddState> emit) {
    try {
      emit(state.copyWith(
          deadline: event.dateTime, stateStatus: EditAddStatus.loadingComplete));
    } catch (_) {
      emit(state.copyWith(stateStatus: EditAddStatus.failure));
    }
  }

  void _onAddSelectedDepartment(
      AddSelectedDepartment event, Emitter<AddState> emit) {
    try {
      emit(state.copyWith(
          departmentId: event.departmentId,
          stateStatus: EditAddStatus.loadingComplete));
    } catch (_) {
      emit(state.copyWith(stateStatus: EditAddStatus.failure));
    }
  }

  Future<void> _onAddDepartments(
      AddDepartments event, Emitter<AddState> emit) async {
    try {
      emit(state.copyWith(stateStatus: EditAddStatus.loading));
      final fromDeptPro = await departmentProvider.getAll();
      emit(state.copyWith(
          departments: fromDeptPro, stateStatus: EditAddStatus.loadingComplete));
    } catch (_) {
      emit(state.copyWith(stateStatus: EditAddStatus.failure));
    }
  }

  Future<void> _onAddSave(AddSave event, Emitter<AddState> emit) async {
    try {
      await _addProvider.save(state.toJson());
      emit(const AddState(stateStatus: EditAddStatus.success));
    } catch (_) {
      emit(state.copyWith(stateStatus: EditAddStatus.failure));
    }
  }
}
