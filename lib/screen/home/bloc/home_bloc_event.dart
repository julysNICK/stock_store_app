part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {
  @override
  List<Object> get props => [];
}

class HomeBlocLoad extends HomeBlocEvent {
  HomeBlocLoad();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocLoad';
}

class HomeBlocRefresh extends HomeBlocEvent {
  HomeBlocRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocRefresh';
}

class HomeBlocAdd extends HomeBlocEvent {
  final Product product;

  HomeBlocAdd({required this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'HomeBlocAdd { product: $product }';
}

class HomeBlocGetAllProducts extends HomeBlocEvent {
  String? category;
  HomeBlocGetAllProducts({
    this.category,
  });

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocGetAllProducts';
}

class HomeBlocUpdate extends HomeBlocEvent {
  final Product product;

  HomeBlocUpdate({required this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'HomeBlocUpdate { product: $product }';
}

class HomeBlocDelete extends HomeBlocEvent {
  final Product product;

  HomeBlocDelete({required this.product});

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'HomeBlocDelete { product: $product }';
}

class HomeBlocDeleteAll extends HomeBlocEvent {
  HomeBlocDeleteAll();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'HomeBlocDeleteAll';
}

class HomeBlocSearch extends HomeBlocEvent {
  final String query;

  HomeBlocSearch({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'HomeBlocSearch { query: $query }';
}

class HomeBlocGetProductBySupplierId extends HomeBlocEvent {
  final String id;

  HomeBlocGetProductBySupplierId({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'HomeBlocGetProductById { id: $id }';
}
