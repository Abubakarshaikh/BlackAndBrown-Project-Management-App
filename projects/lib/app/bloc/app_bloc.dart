import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:projects/app/share/share.dart';

import '../../routes/routes_state.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final UserProvider _userProvider;
  final Share _share = Share();
  AppBloc(this._userProvider) : super(const AppState()) {
    on<AppLoad>(_onAppLoad);
  }

  Future<void> _onAppLoad(AppLoad event, Emitter<AppState> emit) async {
    try {
      final fromShare = await _share.getToken;
      log("------$fromShare");
      if (fromShare!.isNotEmpty) {
        final fromPro = await _userProvider.getUserbyToken(fromShare);
        if (fromPro.name.isNotEmpty) {
          emit(AppState(user: fromPro, status: RouteState.authenticated));
        } else {
          emit(AppState(user: fromPro, status: RouteState.unauthenticated));
        }
      } else {
        emit(const AppState(status: RouteState.unauthenticated));
      }
    } catch (_) {
      emit(const AppState(status: RouteState.unauthenticated));
    }
  }
}