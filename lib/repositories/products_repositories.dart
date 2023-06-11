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

  Future<Product> getProduct(String id) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.get(Uri.parse('$baseUrl/products/$id'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return Product.fromJson(jsonResponse["product"]);
      } else {
        return throw Exception('Failed to load product');
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> getProducts({String? category}) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      print(
          '$baseUrl/products?page_id=1&limit=10&category=${category?.toLowerCase()}');

      final response = await http.get(Uri.parse(
          '$baseUrl/products?page_id=1&limit=10&category=${category?.toLowerCase()}'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        final List<Product> products = [];
        if (jsonResponse.length == 0) {
          return products;
        }

        jsonResponse.forEach((product) {
          products.add(Product.fromJson(product));
        });

        return products;
      } else {
        return throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response =
          await http.get(Uri.parse('$baseUrl/products?category=$category'));
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

  //edit product

  Future<Product> editProduct(Product product) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.put(
        Uri.parse('$baseUrl/products/${product.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return Product.fromJson(jsonResponse['data']);
      } else {
        return throw Exception('Failed to edit product');
      }
    } catch (e) {
      return throw Exception('Failed to edit product');
    }
  }

  Future<Product> deleteProduct(int id) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.delete(Uri.parse('$baseUrl/products/$id'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return Product.fromJson(jsonResponse['data']);
      } else {
        return throw Exception('Failed to delete product');
      }
    } catch (e) {
      return throw Exception('Failed to delete product');
    }
  }
}
