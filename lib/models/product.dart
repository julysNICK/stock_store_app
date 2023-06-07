class Product {
  int id;
  int quantity;
  int storeId;
  int supplierId;

  String name;
  String category;
  String imageUrl;
  String description;
  String price;
  String createdAt;

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
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        category: json["category"] ?? '',
        imageUrl: json["imageUrl"] ?? '',
        description: json["description"] ?? '',
        price: json["price"] ?? '',
        quantity: json["quantity"] ?? 0,
        storeId: json["storeID"] ?? 0,
        supplierId: json["supplierID"] ?? 0,
        createdAt: json["createdAt"] ?? '',
      );
}
