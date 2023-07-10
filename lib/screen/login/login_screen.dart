import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/login/bloc/login_bloc.dart';
import 'package:stock_store/screen/login/widgets/button_login.dart';
import 'package:stock_store/screen/login/widgets/create_account.dart';
import 'package:stock_store/screen/login/widgets/forgot_password.dart';
import 'package:stock_store/screen/login/widgets/form_login.dart';
import 'package:stock_store/screen/login/widgets/logo.dart';
import 'package:stock_store/widgets/popup_error.dart';

import '../../models/store.dart';
import 'bloc/login_state.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  StoreInputsLogin storeInputsLogin = StoreInputsLogin();

  void onTapStoreInputsLogin() {
    BlocProvider.of<LoginBloc>(context).add(LoginLoad(
      email: storeInputsLogin.email,
      password: storeInputsLogin.password,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (mounted) {
      email.dispose();
      password.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoaded) {
            Navigator.pushNamed(context, '/home');
          }

          if (state is LoginError) {
            showDialog(
              context: context,
              builder: (context) =>
                  const Popup_Error(errorMessage: "Verifique os dados"),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                logo(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: form_login(
                          email,
                          password,
                          storeInputsLogin,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      forgot_password(),
                      const SizedBox(
                        height: 20,
                      ),
                      button_login(onTapStoreInputsLogin),
                      const SizedBox(
                        height: 20,
                      ),
                      create_account(
                        context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
