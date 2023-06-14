import 'package:flutter/material.dart';
import 'package:stock_store/screen/login/widgets/button_login.dart';
import 'package:stock_store/screen/login/widgets/create_account.dart';
import 'package:stock_store/screen/login/widgets/forgot_password.dart';
import 'package:stock_store/screen/login/widgets/form_login.dart';
import 'package:stock_store/screen/login/widgets/logo.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      child: form_login(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    forgot_password(),
                    const SizedBox(
                      height: 20,
                    ),
                    button_login(),
                    const SizedBox(
                      height: 20,
                    ),
                    create_account(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
