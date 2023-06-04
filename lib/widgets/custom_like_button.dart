import 'package:flutter/material.dart';

Widget customLikeButton({
  required VoidCallback onTap,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(
      12.0,
    ),
    onTap: () {
      onTap();
    },
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: Icon(
        Icons.favorite_border,
        color: Colors.grey[400],
        size: 15,
      ),
    ),
  );
}
