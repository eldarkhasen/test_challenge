import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/exceptions/failure.dart';
import '../../../domain/repository/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        emit(LoadingLogin());
        final response = await repository.login(
            username: event.username, password: event.password);
        response.fold((l) => emit(FailureLogin(l)), (r) {
          if (r != null) {
            emit(SuccessLogin());
          } else {
            emit(UserNotFound());
          }
        });
      } else if (event is SignUp) {
        emit(LoadingLogin());
        final response = await repository.register(
            username: event.username,
            password: event.password,
            email: event.email);

        response.fold((l) => emit(FailureLogin(l)), (r) {
          emit(SuccessLogin());
        });
      }
    });
  }
}
