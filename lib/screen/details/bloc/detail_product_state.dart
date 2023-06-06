part of 'detail_product_bloc.dart';

@immutable
abstract class DetailProductState {}

class DetailProductInitial extends DetailProductState {
  DetailProductInitial();

  @override
  String toString() => 'DetailProductInitial';
}

class DetailProductLoading extends DetailProductState {
  DetailProductLoading();

  @override
  String toString() => 'DetailProductLoading';
}

class DetailProductLoaded extends DetailProductState {
  final Product product;

  DetailProductLoaded({required this.product});

  @override
  String toString() => 'DetailProductLoaded';
}

class DetailProductError extends DetailProductState {
  DetailProductError();

  @override
  String toString() => 'DetailProductError';
}

class DetailProductNotFound extends DetailProductState {
  DetailProductNotFound();

  @override
  String toString() => 'DetailProductNotFound';
}
