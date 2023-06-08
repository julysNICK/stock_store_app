import 'package:flutter/material.dart';

import '../card_product_item/card_product_item.dart';

class list_products extends StatelessWidget {
  const list_products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemExtent: 100,
        itemBuilder: (ctx, index) {
          return const card_product_item();
        },
      ),
    );
  }
}
