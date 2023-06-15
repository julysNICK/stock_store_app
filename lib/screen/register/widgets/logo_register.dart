import 'package:flutter/material.dart';

SizedBox logo() {
  return SizedBox(
    height: 150,
    child: Stack(children: [
      Positioned(
        child: Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('assets/Checklist.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]),
  );
}
