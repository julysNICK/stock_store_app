part of 'detail_supplier_bloc.dart';

@immutable
abstract class DetailSupplierState {
  Supplier? supplier;

  DetailSupplierState({this.supplier});
}

class DetailSupplierInitial extends DetailSupplierState {
  DetailSupplierInitial() : super();

  @override
  String toString() => 'DetailSupplierInitial';
}

class DetailSupplierLoading extends DetailSupplierState {
  DetailSupplierLoading() : super();

  @override
  String toString() => 'DetailSupplierLoading';
}

class DetailSupplierLoaded extends DetailSupplierState {
  DetailSupplierLoaded({required Supplier supplier})
      : super(supplier: supplier);

  @override
  String toString() => 'DetailSupplierLoaded';
}

class DetailSupplierError extends DetailSupplierState {
  DetailSupplierError() : super();

  @override
  String toString() => 'DetailSupplierError';
}
