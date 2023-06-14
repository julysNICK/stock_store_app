import 'package:flutter/material.dart';

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
