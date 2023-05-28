import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';

Widget customBuyDetailScreen({
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          'Buy more stocks',
          style: TextStyle(
            color: Colors.white,
            fontSize: AppFontSize.fontSizeSubTitle,
            fontWeight: AppFontWeight.fontWeightBold,
          ),
        ),
      ),
    ),
  );
}
