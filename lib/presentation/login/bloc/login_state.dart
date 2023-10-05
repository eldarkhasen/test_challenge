part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLogin extends LoginState {}

class SuccessLogin extends LoginState {}
class UserNotFound extends LoginState {}

class FailureLogin extends LoginState {
  final Failure failure;

  FailureLogin(this.failure);
}
