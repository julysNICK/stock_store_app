part of 'detail_product_bloc.dart';

@immutable
abstract class DetailProductEvent {
  @override
  List<Object> get props => [];
}

class DetailProductLoad extends DetailProductEvent {
  final String id;

  DetailProductLoad({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'DetailProductLoad { id: $id }';
}

class DetailProductUpdate extends DetailProductEvent {
  final Product product;

  DetailProductUpdate({required this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'DetailProductUpdate { product: $product }';
}
