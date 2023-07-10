import 'package:flutter/material.dart';

import '../../../../models/product.dart';

class card_product_item extends StatelessWidget {
  Product product;
  card_product_item({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    double fontSizeProductTitleResponsive = MediaQuery.of(context).size.width *
        (MediaQuery.of(context).size.width <= 450 ? 0.035 : 0.02);

    double fontSizeProductPriceResponsive =
        MediaQuery.of(context).size.width * 0.035;
    return GestureDetector(
      onTap: () {
        print('Card ');
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
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
            const SizedBox(
              height: 2,
            ),
            Text(
              product.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSizeProductTitleResponsive,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'R\$ ${product.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: fontSizeProductPriceResponsive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
