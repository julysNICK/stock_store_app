import '../../../models/store.dart';

abstract class RegisterState {
  Store? store;

  RegisterState({this.store});
}

class RegisterInitial extends RegisterState {
  RegisterInitial() : super();

  @override
  String toString() => 'RegisterInitial';
}

class RegisterLoading extends RegisterState {
  RegisterLoading();
}

class RegisterLoaded extends RegisterState {
  RegisterLoaded({required Store store}) : super(store: store);

  @override
  String toString() => 'RegisterLoaded';
}

class RegisterError extends RegisterState {
  RegisterError();
}
