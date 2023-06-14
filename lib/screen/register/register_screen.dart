import 'package:flutter/material.dart';

class Register_screen extends StatelessWidget {
  const Register_screen({super.key});

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
                      child: form_register(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    button_register(),
                    const SizedBox(
                      height: 20,
                    ),
                    enter_account(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center enter_account() {
    return const Center(
      child: Text(
        "Make login",
        style: TextStyle(
          color: Color.fromRGBO(49, 39, 79, .6),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container button_register() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(49, 29, 79, 1),
      ),
      child: const Center(
        child: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Column form_register() {
    return Column(
      children: [
        input_text(),
        input_text(),
        input_text(),
        input_text(),
        input_text(),
        input_password(),
      ],
    );
  }

  Container input_text() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Email or Phone number",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Container input_password() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  SizedBox logo() {
    return SizedBox(
      height: 150,
      child: Stack(children: [
        Positioned(
          child: Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/Checklist.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
