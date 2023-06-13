import 'package:flutter/material.dart';

import '../../../../models/product.dart';
import '../../../../widgets/product_card.dart';
import '../../../details/details_screen.dart';

Widget buildProductListView({
  List<Product> productDataTest = const [],
}) {
  return ListView.builder(
    itemCount: productDataTest.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => DetailsScreen(
                        product: productDataTest[index],
                      )),
                ),
              );
            },
            child: ProductCard(
              product: productDataTest[index],
              isLiked: false,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
    },
  );
}
