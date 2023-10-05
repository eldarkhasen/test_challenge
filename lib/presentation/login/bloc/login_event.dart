part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String username;
  final String password;

  Login(this.username, this.password);
}

class SignUp extends LoginEvent {
  final String email;
  final String username;
  final String password;

  SignUp(this.email, this.username, this.password);
}
