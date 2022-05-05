part of 'login_bloc.dart';

enum loginStatus { initial, loading, success, failure }

class LoginState {
  final loginStatus status;
  final String? email;
  final String? password;
  final String? token;
  const LoginState({
    this.status = loginStatus.initial,
    this.email,
    this.password,
    this.token,
  });

  LoginState copyWith({
    loginStatus? status,
    String? email,
    String? password,
    String? token,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      email: map['email'],
      password: map['password'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginState.fromJson(String source) =>
      LoginState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LoginState(status: $status, email: $email, password: $password, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.status == status &&
        other.email == email &&
        other.password == password &&
        other.token == token;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode;
  }
}
