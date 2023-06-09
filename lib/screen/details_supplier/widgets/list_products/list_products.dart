import 'package:flutter/material.dart';
import 'package:stock_store/models/product.dart';

import '../card_product_item/card_product_item.dart';

class list_products extends StatelessWidget {
  List<Product> products = [];
  list_products({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemExtent: 100,
        itemBuilder: (ctx, index) {
          return card_product_item(
            product: products[index],
          );
        },
      ),
    );
  }
}
