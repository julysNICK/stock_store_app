import 'package:flutter/material.dart';

InkWell enter_account(
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/login');
    },
    child: const Center(
      child: Text(
        "Make login",
        style: TextStyle(
          color: Color.fromRGBO(49, 39, 79, .6),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
