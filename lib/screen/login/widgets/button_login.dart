import 'package:flutter/material.dart';

Container button_login() {
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
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
