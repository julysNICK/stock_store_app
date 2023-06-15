import '../../../models/store.dart';

abstract class LoginState {
  Login_store? login;

  LoginState({this.login});
}

class LoginInitial extends LoginState {
  LoginInitial() : super();

  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  LoginLoading();
}

class LoginLoaded extends LoginState {
  LoginLoaded({required Login_store login}) : super(login: login);

  @override
  String toString() => 'LoginLoaded';
}

class LoginError extends LoginState {
  LoginError();
}
