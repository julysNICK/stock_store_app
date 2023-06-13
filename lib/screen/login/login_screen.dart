import 'package:flutter/material.dart';

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
                padding: const EdgeInsets.only(top: 50),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column form_login() {
    return Column(
      children: [
        Container(
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
        ),
        Container(
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
        ),
      ],
    );
  }

  SizedBox logo() {
    return SizedBox(
      height: double.infinity,
      child: Stack(children: [
        Positioned(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                image: AssetImage('assets/4043715.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
