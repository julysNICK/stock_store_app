part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {
  List<Product> products = [];
  String? message;

  HomeBlocState({
    this.products = const [],
    this.message,
  });

  @override
  List<Object> get props => [];
}

class HomeBlocInitial extends HomeBlocState {
  HomeBlocInitial() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocInitial';
}

class HomeBlocLoading extends HomeBlocState {
  HomeBlocLoading() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocLoading';
}

class HomeBlocLoaded extends HomeBlocState {
  HomeBlocLoaded({required List<Product> products}) : super(products: products);

  @override
  List<Object> get props => [products];

  @override
  String toString() => 'HomeBlocLoaded';
}

class HomeBlocError extends HomeBlocState {
  HomeBlocError({required String message}) : super(message: message);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocError';
}

class HomeBlocLoadedBySupplierId extends HomeBlocState {
  HomeBlocLoadedBySupplierId({required List<Product> products})
      : super(products: products);

  @override
  List<Object> get props => [products];

  @override
  String toString() => 'HomeBlocLoaded';
}
