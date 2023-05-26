import 'package:flutter/material.dart';

Widget customIconButton({
  Widget? child,
  Color? backColor,
  Color? splashColor,
  BorderRadius? radius,
  void Function()? onTap,
}) {
  return InkWell(
    borderRadius: radius,
    splashColor: splashColor,
    onTap: onTap,
    child: Ink(
      padding: const EdgeInsets.all(
        8.0,
      ),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: radius,
      ),
      child: child,
    ),
  );
}
