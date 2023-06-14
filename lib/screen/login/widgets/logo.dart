import 'package:flutter/material.dart';

SizedBox logo() {
  return SizedBox(
    height: 300,
    child: Stack(children: [
      Positioned(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('assets/4043715.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]),
  );
}
