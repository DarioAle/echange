import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:echange/auth/user_auth_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  // atuh provider
  UserAuthProvider _authProvider = UserAuthProvider();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithGoogleEvent) {
      try {
        yield LoginLoadingState();
        await _authProvider.signInWithGoogle();
        yield LoginSuccessState();
      } catch (e) {
        print(e.toString());
        yield LoginErrorState(error: "Error al hacer login: ${e.toString()}");
      }
    }
  }
}
