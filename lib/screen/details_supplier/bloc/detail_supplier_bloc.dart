import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/models/supplier.dart';

import '../../../service/supplier_service.dart';

part 'detail_supplier_event.dart';
part 'detail_supplier_state.dart';

class DetailSuppBloc extends Bloc<DetailSupplierEvent, DetailSupplierState> {
  DetailSuppBloc() : super(DetailSupplierInitial()) {
    on<DetailSupplierEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DetailSupplierLoad>((event, emit) async {
      print('SupplierGetSupplierById');
      emit(DetailSupplierLoading());
      try {
        final supplier = await SupplierService().getSupplier(event.id);

        emit(DetailSupplierLoaded(supplier: supplier));
        // emit(SupplierInitial());
      } catch (e) {
        print(e);
        emit(DetailSupplierError());
      }
    });
  }
}
