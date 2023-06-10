part of 'detail_supplier_bloc.dart';

@immutable
abstract class DetailSupplierEvent {
  @override
  List<Object> get props => [];
}

class DetailSupplierLoad extends DetailSupplierEvent {
  final String id;

  DetailSupplierLoad({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'DetailSupplierLoad { id: $id }';
}

class DetailSupplierRefresh extends DetailSupplierEvent {
  DetailSupplierRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DetailSupplierRefresh';
}
