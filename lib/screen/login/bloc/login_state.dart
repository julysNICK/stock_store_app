part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  Login_store? login;

  LoginInitial({this.login});
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginLoaded extends LoginState {
  LoginLoaded();
}

class LoginError extends LoginState {
  LoginError();
}
