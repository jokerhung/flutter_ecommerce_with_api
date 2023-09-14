part of 'sign_in_bloc.dart';

class SignInState {
  final String email;
  final String password;
  final List<String> errors;
  final bool isRemember;
  final String loginResult;

  SignInState(
      {required this.email,
      required this.password,
      required this.errors,
      required this.isRemember,
      required this.loginResult});

  SignInState copyWith(
      {String? email,
      String? password,
      List<String>? errors,
      bool? isRemember,
      String? loginResult}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        errors: errors ?? this.errors,
        isRemember: isRemember ?? this.isRemember,
        loginResult: loginResult ?? this.loginResult);
  }
}

class SignInInitial extends SignInState {
  SignInInitial()
      : super(
            email: "mor_2314",
            password: "83r5^_",
            errors: [],
            isRemember: false,
            loginResult: "None");
}
