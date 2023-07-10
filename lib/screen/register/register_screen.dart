import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_store/screen/register/widgets/button_register.dart';
import 'package:stock_store/screen/register/widgets/enter_account_register.dart';
import 'package:stock_store/screen/register/widgets/form_register.dart';

import '../../widgets/popup_error.dart';
import '../login/widgets/logo.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_state.dart';

class Register_screen extends StatelessWidget {
  const Register_screen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController contactEmail = TextEditingController();
    TextEditingController contactPhone = TextEditingController();
    TextEditingController password = TextEditingController();

    void onTapRegister() {
      BlocProvider.of<RegisterBloc>(context).add(
        RegisterLoad(
          name: name.text,
          address: address.text,
          email: contactEmail.text,
          phone: contactPhone.text,
          password: password.text,
        ),
      );
    }

    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoaded) {
            Navigator.pushNamed(context, '/login');
          }

          if (state is RegisterError) {
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
                        "Register",
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
                        child: form_register(
                          name,
                          address,
                          contactEmail,
                          contactPhone,
                          password,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      button_register(
                        onTapRegister,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      enter_account(
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
