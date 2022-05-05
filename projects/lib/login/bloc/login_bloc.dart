import 'dart:async';
import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:projects/app/share/share.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthProvider _authProvider;
  final UserProvider _userProvider;
  final Share _share = Share();
  LoginBloc(this._authProvider, this._userProvider)
      : super(const LoginState()) {
    on<LoginEmail>(_onLoginEmail);
    on<LoginPassword>(_onLoginPassword);
    on<LoginSubmit>(_onLoginSubmit);
    on<LoginToken>(_onLoginToken);
  }

  Future<void> _onLoginToken(LoginToken event, Emitter<LoginState> emit) async {
    String? token = await _share.getToken;
    if (token != null) {
      emit(state.copyWith(token: token));
    } else {
      await _share.generateToken();
      token = await _share.getToken;
      emit(state.copyWith(token: token ?? ''));
    }
  }

  Future<void> _onLoginEmail(LoginEmail event, Emitter<LoginState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onLoginPassword(
      LoginPassword event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginSubmit(
      LoginSubmit event, Emitter<LoginState> emit) async {
    try {
      emit(state.copyWith(status: loginStatus.loading));
      await _authProvider.login(state.toJson());
      final user = await _userProvider.getUserbyToken(state.token!);
      if (user.email.isNotEmpty) {
        emit(state.copyWith(status: loginStatus.success));
      } else {
        emit(state.copyWith(status: loginStatus.initial));
      }
    } catch (_) {
      emit(state.copyWith(status: loginStatus.failure));
    }
  }
}
