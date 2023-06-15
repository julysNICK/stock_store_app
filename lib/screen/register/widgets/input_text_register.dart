import 'package:flutter/material.dart';

Container input_text(
  TextEditingController controller,
  String hintText,
) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter $hintText",
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}
