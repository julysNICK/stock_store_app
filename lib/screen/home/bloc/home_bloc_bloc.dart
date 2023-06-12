import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/models/product.dart';
import 'package:stock_store/service/product_service.dart';
import 'package:stock_store/service/supplier_service.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeBlocGetAllProducts>((event, emit) async {
      print('HomeBlocGetAllProducts');
      print(event.category);
      emit(HomeBlocLoading());
      try {
        final productAll = await ProductService().getProducts(
          category: event.category,
        );
        emit(HomeBlocLoaded(
          products: productAll,
        ));
        // emit(HomeBlocInitial());
      } catch (e) {
        print(e);
        emit(HomeBlocError());
      }
    });
    on<HomeBlocGetProductBySupplierId>((event, emit) async {
      print('HomeBlocGetProductBySupplierId');
      emit(HomeBlocLoading());
      try {
        final productAll = await SupplierService().getProductBySupplierId(
          event.id,
        );

        emit(HomeBlocLoaded(
          products: productAll,
        ));
        // emit(HomeBlocInitial());
      } catch (e) {
        print(e);
        emit(HomeBlocError());
      }
    });

    on<HomeBlocSearch>((event, emit) async {
      print('HomeBlocSearch');
      emit(HomeBlocLoading());
      try {
        final productAll = await ProductService().searchProduct(
          event.query,
        );

        emit(HomeBlocLoaded(
          products: productAll,
        ));
        // emit(HomeBlocInitial());
      } catch (e) {
        print(e);
        emit(HomeBlocError());
      }
    });
  }
}
