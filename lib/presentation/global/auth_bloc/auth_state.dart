part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authorized extends AuthState {}

class Unauthorized extends AuthState {}
