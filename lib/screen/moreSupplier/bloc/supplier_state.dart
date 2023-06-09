part of 'supplier_bloc.dart';

@immutable
abstract class SupplierState {
  List<Supplier> suppliers = [];

  SupplierState({
    this.suppliers = const [],
  });

  @override
  List<Object> get props => [];
}

class SupplierInitial extends SupplierState {
  SupplierInitial() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SupplierInitial';
}

class SupplierLoading extends SupplierState {
  SupplierLoading() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SupplierLoading';
}

class SupplierLoaded extends SupplierState {
  SupplierLoaded({required List<Supplier> suppliers})
      : super(suppliers: suppliers);

  @override
  List<Object> get props => [suppliers];

  @override
  String toString() => 'SupplierLoaded';
}

class SupplierError extends SupplierState {
  SupplierError() : super();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SupplierError';
}

class supplierLoadedProductBySupplierId extends SupplierState {
  supplierLoadedProductBySupplierId({required List<Supplier> suppliers})
      : super(suppliers: suppliers);

  @override
  List<Object> get props => [suppliers];

  @override
  String toString() => 'supplierLoadedProductBySupplierId';
}
