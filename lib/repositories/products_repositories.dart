import 'dart:convert';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductRepositories {
  ProductRepositories._internal();
  static final ProductRepositories _singleton = ProductRepositories._internal();

  factory ProductRepositories() {
    return _singleton;
  }

  String returnError(String error) {
    return error;
  }

  Future<List<Product>> getProducts() async {
    try {
      var baseUrl = 'http://localhost:3000';
      final response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        final List<Product> products = [];
        jsonResponse['data'].forEach((product) {
          products.add(Product.fromJson(product));
        });
        return products;
      } else {
        return throw Exception('Failed to load products');
      }
    } catch (e) {
      return throw Exception('Failed to load products');
    }
  }
}
