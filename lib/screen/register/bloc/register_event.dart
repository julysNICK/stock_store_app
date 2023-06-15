part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterEvent';
}

class RegisterLoad extends RegisterEvent {
  final String password;
  final String email;
  final String name;
  final String phone;
  final String address;

  RegisterLoad(
      {required this.password,
      required this.email,
      required this.name,
      required this.phone,
      required this.address});

  @override
  List<Object> get props => [password, email, name, phone, address];

  @override
  String toString() =>
      'RegisterLoad { password: $password, email: $email, name: $name, phone: $phone, address: $address }';
}

class RegisterRefresh extends RegisterEvent {
  RegisterRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterRefresh';
}

class RegisterLogout extends RegisterEvent {
  RegisterLogout();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterLogout';
}

class RegisterCheck extends RegisterEvent {
  RegisterCheck();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'RegisterCheck';
}
