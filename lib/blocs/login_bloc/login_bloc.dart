import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../services/api_service.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiService apiService;

  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginUser>(_login);
  }

  _login(LoginUser event, emit) async {
    emit(LoginStateLoading());
    final result = await apiService.loginUser(event.phone, event.password);
    result.isSuccess
        ? emit(LoginStateSuccess())
        : emit(LoginStateError(result.errorMessage!));
  }
}
