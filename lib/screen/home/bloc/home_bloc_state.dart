part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {
  List<Product> products = [];

  HomeBlocState({
    this.products = const [],
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
  HomeBlocError() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocError';
}
