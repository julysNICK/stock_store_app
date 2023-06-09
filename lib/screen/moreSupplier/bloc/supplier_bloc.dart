import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/supplier.dart';
import '../../../service/supplier_service.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  SupplierBloc() : super(SupplierInitial()) {
    // TODO: implement event handler

    on<SupplierGetAllSuppliers>((event, emit) async {
      print('SupplierGetAllSuppliers');
      emit(SupplierLoading());
      try {
        final supplierAll = await SupplierService().getSuppliers();
        print(supplierAll);
        emit(SupplierLoaded(
          suppliers: supplierAll,
        ));
        // emit(SupplierInitial());
      } catch (e) {
        print(e);
        emit(SupplierError());
      }
    });

    on<SupplierGetSupplierById>((event, emit) async {
      print('SupplierGetSupplierById');
      emit(SupplierLoading());
      try {
        final supplier = await SupplierService().getSupplier(event.id);
        print(supplier);
        emit(SupplierLoaded(
          suppliers: [supplier],
        ));
        // emit(SupplierInitial());
      } catch (e) {
        print(e);
        emit(SupplierError());
      }
    });
  }
}
