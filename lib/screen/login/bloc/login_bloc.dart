import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_store/service/store_service.dart';

import 'login_state.dart';

part 'login_event.dart';

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
            await StoreService().loginStore(event.email, event.password);
        emit(LoginLoaded(
          login: login,
        ));
      } catch (e) {
        print(e);
        emit(LoginError());
      }
    });
  }
}
