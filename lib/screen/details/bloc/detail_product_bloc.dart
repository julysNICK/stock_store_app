import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/product.dart';
import '../../../service/product_service.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  DetailProductBloc() : super(DetailProductInitial()) {
    on<DetailProductEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DetailProductLoad>((event, emit) async {
      print('DetailProductLoad');
      emit(DetailProductLoading());
      try {
        final product = await ProductService().getProduct(event.id);
        if (product != null) {
          emit(DetailProductLoaded(product: product));
        } else {
          emit(DetailProductNotFound());
        }
      } catch (e) {
        print(e);
        emit(DetailProductError());
      }
    });
  }
}
