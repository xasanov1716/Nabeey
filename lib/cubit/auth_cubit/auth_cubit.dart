import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:contest_app/services/api_service.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  ApiService apiService;

  AuthCubit(this.apiService) : super(AuthInitial());

  Future<void> auth({
    required String name,
    required String lastname,
    required String phone,
    required String password,
    required String email,
    required File image,
  }) async {
    emit(AuthLoading());
    final response =
        await apiService.auth(name, lastname, phone, password, email, image);
    response.isSuccess
        ? emit(AuthSuccess())
        : emit(AuthError(response.errorMessage!));
  }
}
