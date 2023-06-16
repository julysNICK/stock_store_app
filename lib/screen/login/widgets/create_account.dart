import 'package:flutter/material.dart';

InkWell create_account(
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/register');
    },
    child: const Center(
      child: Text(
        "Create Account",
        style: TextStyle(
          color: Color.fromRGBO(49, 39, 79, .6),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
