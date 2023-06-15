import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/screen/register/bloc/register_state.dart';

import '../../../service/store_service.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<RegisterLoad>((event, emit) async {
      print('RegisterLoad');
      emit(RegisterLoading());

      try {
        final store = await StoreService().createStore(event.name,
            event.address, event.email, event.phone, event.password);
        print(store);
        emit(RegisterLoaded(
          store: store,
        ));
      } catch (e) {
        print(e);
        emit(RegisterError());
      }
    });
  }
}
