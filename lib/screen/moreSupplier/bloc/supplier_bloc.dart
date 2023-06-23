import 'dart:convert';

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
      final chatAll;
      Map<String, String> allValues = await storage.readAll();

      final decodeJsonStore = jsonDecode(allValues['token']!);
      print(decodeJsonStore);
      emit(SupplierLoading());
      try {
        final supplierAll = await SupplierService().getSuppliers(
          acessToken: decodeJsonStore['access_token'],
        );

        emit(SupplierLoaded(
          suppliers: supplierAll,
        ));
        // emit(SupplierInitial());
      } catch (e) {
        print(e);
        emit(SupplierError());
      }
    });

    // on<SupplierGetSupplierById>((event, emit) async {
    //   print('SupplierGetSupplierById');
    //   emit(SupplierLoading());
    //   try {
    //     final supplier = await SupplierService().getSupplier(event.id);

    //     emit(SupplierLoaded(
    //       suppliers: [supplier],
    //     ));
    //     // emit(SupplierInitial());
    //   } catch (e) {
    //     print(e);
    //     emit(SupplierError());
    //   }
    // });
  }

  get storage => null;
}
