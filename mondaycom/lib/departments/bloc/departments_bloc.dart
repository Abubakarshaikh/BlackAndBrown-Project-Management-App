import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'departments_event.dart';
part 'departments_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentProvider _departmentProvider;
  DepartmentBloc(this._departmentProvider) : super(const DepartmentState()) {
    on<DepartmentLoad>(_onDepartmentEventLoad);
    on<DepartmentRefreshIndicator>(_onDepartmentRefreshIndicator);
  }

  Future<void> _onDepartmentEventLoad(
      DepartmentLoad event, Emitter<DepartmentState> emit) async {
    try {
      emit(const DepartmentState(status: DepartmentStatus.loading));
      final List<Department> fromRepo = await _departmentProvider.getAll();
      emit(DepartmentState(
          departments: fromRepo, status: DepartmentStatus.success));
    } catch (_) {
      emit(const DepartmentState(status: DepartmentStatus.failure));
    }
  }

  Future<void> _onDepartmentRefreshIndicator(
      DepartmentRefreshIndicator event, Emitter<DepartmentState> emit) async {
    try {
      final List<Department> fromRepo = await _departmentProvider.getAll();
      emit(state.copyWith(departments: fromRepo));
    } catch (e) {
      emit(state);
    }
  }
}
