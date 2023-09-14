part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class EmailEvent extends SignInEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  PasswordEvent(this.password);
}

class RememberEvent extends SignInEvent {
  final bool isRemember;
  RememberEvent(this.isRemember);
}

class ErrorEvent extends SignInEvent {
  final List<String> errors;
  ErrorEvent(this.errors);
}

class ContinueEvent extends SignInEvent {}
