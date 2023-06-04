import 'dart:async';
import 'dart:ffi';

class Product {
  Int64 id;
  String name;
  String category;
  String imageUrl;
  String description;
  String price;
  Int32 quantity;
  Int64 storeId;
  Int64 supplierId;
  Timer createdAt;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.quantity,
    required this.storeId,
    required this.supplierId,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        storeId: json["storeId"],
        supplierId: json["supplierId"],
        createdAt: json["createdAt"],
      );
}
