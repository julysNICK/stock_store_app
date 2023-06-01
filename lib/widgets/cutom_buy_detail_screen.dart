import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';

Widget customBuyDetailScreen(
    {Function()? onTap,
    required String title,
    required Color color,
    required Color colorButton}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: AppFontSize.fontSizeSubTitle,
            fontWeight: AppFontWeight.fontWeightBold,
          ),
        ),
      ),
    ),
  );
}
