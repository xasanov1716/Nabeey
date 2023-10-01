part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUser extends LoginEvent{
  final String phone;
  final String password;

  LoginUser({
    required this.phone,
    required this.password,
  });
}
