import 'package:flutter/material.dart';
import 'package:stock_store/constants/constants.dart';
import 'package:stock_store/models/product.dart';

import 'custom_buy_button.dart';
import 'custom_like_button.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  bool isLiked;
  ProductCard({super.key, required this.product, required this.isLiked});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
                customLikeButton(onTap: () {
                  print('Like button tapped');
                  setState(() {
                    widget.isLiked = !widget.isLiked;
                  });
                }),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 140,
                    child: Hero(
                      tag: widget.product.id,
                      child: Image.network(
                        widget.product.imageUrl,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
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
                    text: widget.product.name,
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
                Text(widget.product.category,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: AppFontSize.fontSizeBody * 1.2,
                      fontWeight: AppFontWeight.fontWeightNormal,
                      fontFamily: appFontFamily.fontFamilyDefault,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${widget.product.price}",
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
