import 'package:flutter/material.dart';
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
                    child: Image.network(product.image),
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
                    text: product.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nby nike',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Text(
                  product.tagLine,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
