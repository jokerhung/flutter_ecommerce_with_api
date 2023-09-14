import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/data/repositories/login_api.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final LoginApi loginApi;

  SignInBloc(this.loginApi) : super(SignInInitial()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RememberEvent>(_rememberEvent);
    on<ErrorEvent>(_errorEvent);
    on<ContinueEvent>(_continueEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print("LOG_SignInBloc_emailEvent(): email is ${event.email}");
    String value = event.email;
    List<String> errors = state.errors;
    if (value.isNotEmpty && errors.contains(kEmailNullError)) {
      errors.remove(kEmailNullError);
      emit(state.copyWith(email: event.email, errors: errors));
    } else if (value.isEmpty && !errors.contains(kEmailNullError)) {
      errors.add(kEmailNullError);
      emit(state.copyWith(email: event.email, errors: errors));
    } else {
      emit(state.copyWith(email: event.email));
    }
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    print("LOG_SignInBloc_passwordEvent(): password is ${event.password}");
    String value = event.password;
    List<String> errors = state.errors;
    if (value.isEmpty && !errors.contains(kPassNullError)) {
      errors.add(kPassNullError);
      emit(state.copyWith(password: event.password, errors: errors));
    } else if (value.length < 4 && !errors.contains(kShortPassError)) {
      errors.add(kShortPassError);
      emit(state.copyWith(password: event.password, errors: errors));
    } else if (value.isNotEmpty && errors.contains(kPassNullError)) {
      errors.remove(kPassNullError);
      emit(state.copyWith(password: event.password, errors: errors));
    } else if (value.length >= 4 && errors.contains(kShortPassError)) {
      errors.remove(kShortPassError);
      emit(state.copyWith(password: event.password, errors: errors));
    } else {
      emit(state.copyWith(password: event.password));
    }
  }

  void _rememberEvent(RememberEvent event, Emitter<SignInState> emit) {
    print("LOG_SignInBloc_rememberEvent: isRemember is ${event.isRemember}");
    emit(state.copyWith(isRemember: event.isRemember));
  }

  void _errorEvent(ErrorEvent event, Emitter<SignInState> emit) {
    print("LOG_SignInBloc_errorEvent: error items is ${event.errors.length}");
    emit(state.copyWith(errors: event.errors));
  }

  Future<void> _continueEvent(
      ContinueEvent event, Emitter<SignInState> emit) async {
    try {
      emit(state.copyWith(loginResult: "InProgress"));
      print(
          "LOG_SignInBloc_continueEvent(): Login with ${state.email} and ${state.password}");
      final loginResp = await loginApi.login(state.email, state.password);
      if (loginResp.token!.isNotEmpty) {
        print("LOG_SignInBloc_continueEvent(): Login success");
        emit(state.copyWith(loginResult: "Success"));
      } else {
        print("LOG_SignInBloc_continueEvent(): empty token");
        emit(state.copyWith(loginResult: "Token Error"));
      }
    } catch (e) {
      print("LOG_SignInBloc_continueEvent(): error = ${e.toString()}");
      emit(state.copyWith(loginResult: e.toString()));
    }
  }
}
