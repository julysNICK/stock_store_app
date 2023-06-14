import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/service/store_service.dart';

import '../../../models/store.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginLoad>((event, emit) async {
      print('LoginLoad');
      emit(LoginLoading());
      try {
        final login =
            await StoreService().loginStore(event.username, event.password);
        print(login);
        emit(LoginLoaded());
      } catch (e) {
        print(e);
        emit(LoginError());
      }
    });
  }
}
