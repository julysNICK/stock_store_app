part of 'detail_product_bloc.dart';

@immutable
abstract class DetailProductState {
  Product? product = Product(
    id: 0,
    name: '',
    description: '',
    price: "",
    imageUrl: '',
    category: '',
    createdAt: "",
    storeId: 0,
    quantity: 0,
    supplierId: 0,
  );

  DetailProductState({this.product});

  @override
  List<Object> get props => [];
}

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
  @override
  final Product product;

  DetailProductLoaded({required this.product}) : super(product: product);

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
