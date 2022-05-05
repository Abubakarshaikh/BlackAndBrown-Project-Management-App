part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginLoad extends LoginEvent {
  const LoginLoad();
}

class LoginToken extends LoginEvent {
  const LoginToken();
}

class LoginEmail extends LoginEvent {
  final String email;
  const LoginEmail({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginPassword extends LoginEvent {
  final String password;
  const LoginPassword({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}
