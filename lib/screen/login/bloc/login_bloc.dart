import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock_store/service/store_service.dart';

import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    const storage = FlutterSecureStorage();
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginLoad>((event, emit) async {
      print('LoginLoad');
      emit(LoginLoading());

      try {
        final login =
            await StoreService().loginStore(event.email, event.password);

        await storage.write(key: 'token', value: login.accessToken);

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
