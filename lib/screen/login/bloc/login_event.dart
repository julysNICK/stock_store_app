part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginLoad extends LoginEvent {
  final String username;
  final String password;

  LoginLoad({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];

  @override
  String toString() => 'LoginLoad { username: $username, password: $password }';
}

class LoginRefresh extends LoginEvent {
  LoginRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginRefresh';
}

class LoginLogout extends LoginEvent {
  LoginLogout();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginLogout';
}

class LoginCheck extends LoginEvent {
  LoginCheck();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginCheck';
}

class LoginCheckToken extends LoginEvent {
  LoginCheckToken();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginCheckToken';
}

class LoginCheckTokenSuccess extends LoginEvent {
  final String token;

  LoginCheckTokenSuccess({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoginCheckTokenSuccess { token: $token }';
}

class LoginCheckTokenFailed extends LoginEvent {
  LoginCheckTokenFailed();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoginCheckTokenFailed';
}
