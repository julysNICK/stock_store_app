part of 'supplier_bloc.dart';

@immutable
abstract class SupplierEvent {
  @override
  List<Object> get props => [];
}

class SupplierLoad extends SupplierEvent {
  SupplierLoad();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SupplierLoad';
}

class SupplierRefresh extends SupplierEvent {
  SupplierRefresh();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SupplierRefresh';
}

class SupplierAdd extends SupplierEvent {
  final Supplier supplier;

  SupplierAdd({required this.supplier});

  @override
  List<Object> get props => [supplier];

  @override
  String toString() => 'SupplierAdd { supplier: $supplier }';
}

class SupplierGetAllSuppliers extends SupplierEvent {
  SupplierGetAllSuppliers();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SupplierGetAllSuppliers';
}

class SupplierUpdate extends SupplierEvent {
  final Supplier supplier;

  SupplierUpdate({required this.supplier});

  @override
  List<Object> get props => [supplier];

  @override
  String toString() => 'SupplierUpdate { supplier: $supplier }';
}

class SupplierDelete extends SupplierEvent {
  final Supplier supplier;

  SupplierDelete({required this.supplier});

  @override
  List<Object> get props => [supplier];

  @override
  String toString() => 'SupplierDelete { supplier: $supplier }';
}

class SupplierSearch extends SupplierEvent {
  final String query;

  SupplierSearch({required this.query});

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'SupplierSearch { query: $query }';
}
