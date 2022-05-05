part of 'app_bloc.dart';

class AppState extends Equatable {
  final RouteState status;
  final User? user;

  const AppState({this.user, this.status = RouteState.splashPage});

  @override
  List<Object?> get props => [status, user];
}
