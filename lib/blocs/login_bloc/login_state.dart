part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginStateLoading extends LoginState {}

class LoginStateError extends LoginState {
  final String errorMessage;

  LoginStateError(this.errorMessage);
}

class LoginStateSuccess extends LoginState {
  final String token;
  LoginStateSuccess(this.token);
}