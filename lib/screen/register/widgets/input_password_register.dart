import 'package:flutter/material.dart';

Container input_password(
  TextEditingController password,
  String hintText,
) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextField(
      controller: password,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}
