import 'package:flutter/material.dart';

InkWell button_register(
  void Function() onTapRegister,
) {
  return InkWell(
    onTap: onTapRegister,
    child: Container(
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
    ),
  );
}
