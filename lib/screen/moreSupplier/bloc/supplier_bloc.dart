import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/supplier.dart';
import '../../../service/supplier_service.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  SupplierBloc() : super(SupplierInitial()) {
    on<SupplierEvent>((event, emit) {
      // TODO: implement event handler

      on<SupplierGetAllSuppliers>((event, emit) async {
        print('SupplierGetAllSuppliers');
        emit(SupplierLoading());
        try {
          final supplierAll = await SupplierService().getSuppliers();
          emit(SupplierLoaded(
            suppliers: supplierAll,
          ));
          // emit(SupplierInitial());
        } catch (e) {
          print(e);
          emit(SupplierError());
        }
      });
    });
  }
}
