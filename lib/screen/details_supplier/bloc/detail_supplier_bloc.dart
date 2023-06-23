import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/models/supplier.dart';

import '../../../service/supplier_service.dart';

part 'detail_supplier_event.dart';
part 'detail_supplier_state.dart';

class DetailSuppBloc extends Bloc<DetailSupplierEvent, DetailSupplierState> {
  DetailSuppBloc() : super(DetailSupplierInitial()) {
    const storage = FlutterSecureStorage();
    on<DetailSupplierEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DetailSupplierLoad>((event, emit) async {
      print('SupplierGetSupplierById');
      Map<String, String> allValues = await storage.readAll();

      final decodeJsonStore = jsonDecode(allValues['token']!);
      print(decodeJsonStore);
      emit(DetailSupplierLoading());
      try {
        final supplier = await SupplierService().getSupplier(
          event.id,
          acessToken: decodeJsonStore['access_token'],
        );

        emit(DetailSupplierLoaded(supplier: supplier));
        // emit(SupplierInitial());
      } catch (e) {
        print(e);
        emit(DetailSupplierError());
      }
    });
  }
}
