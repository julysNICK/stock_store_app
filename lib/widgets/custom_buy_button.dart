import 'package:flutter/material.dart';

Widget customBuyButton() {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
          child: Text(
        'Details',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )),
    ),
  );
}
