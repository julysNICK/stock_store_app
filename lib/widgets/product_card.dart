import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';
import 'package:stock_store/data/data.dart';

import 'custom_buy_button.dart';
import 'custom_like_button.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: product.color,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      height: 180,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customLikeButton(),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 140,
                    child: Hero(
                        tag: product.id, child: Image.network(product.image)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    spellOut: true,
                    text: product.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: AppFontSize.fontSizeTitle * 1.2,
                      fontWeight: AppFontWeight.fontWeightBold,
                      fontFamily: appFontFamily.fontFamilyDefault,
                      overflow: TextOverflow.ellipsis,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nby nike',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: AppFontSize.fontSizeBody * 1.2,
                          fontWeight: AppFontWeight.fontWeightNormal,
                          fontFamily: appFontFamily.fontFamilyDefault,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(product.tagLine,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: AppFontSize.fontSizeBody * 1.2,
                      fontWeight: AppFontWeight.fontWeightNormal,
                      fontFamily: appFontFamily.fontFamilyDefault,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${product.price}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: AppFontSize.fontSizeTitle * 1.5,
                          fontWeight: AppFontWeight.fontWeightBold,
                          fontFamily: appFontFamily.fontFamilyDefault,
                        )),
                    customBuyButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
