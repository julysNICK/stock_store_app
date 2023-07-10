import 'dart:convert';
import 'dart:typed_data';

import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ProductRepositories {
  ProductRepositories._internal();
  static final ProductRepositories _singleton = ProductRepositories._internal();

  factory ProductRepositories() {
    return _singleton;
  }

  String returnError(String error) {
    return error;
  }

  Map<String, String> returnHeader(
    dynamic acessToken,
  ) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $acessToken',
    };
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
      return throw Exception(e);
    }
  }

  Future<List<Product>> getProductsCached({
    String? category,
    dynamic acessToken,
    dynamic baseUrl,
    required FileInfo? fileInfo,
  }) async {
    try {
      var cachedResponse = await DefaultCacheManager().getSingleFile(
          '$baseUrl/products?page_id=1&limit=10&category=${category?.toLowerCase()}');

      var jsonResponse = jsonDecode(await cachedResponse.readAsString());

      final List<Product> products = [];

      if (jsonResponse.length == 0) {
        return products;
      }

      jsonResponse.forEach((product) {
        products.add(Product.fromJson(product));
      });

      return products;
    } catch (e) {
      print(e);
      return throw Exception(e);
    }
  }

  Future<List<Product>> getProductsUrl({
    required String category,
    dynamic acessToken,
    dynamic baseUrl,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/products?page_id=1&limit=10&category=${category.toLowerCase()}'),
        headers: returnHeader(acessToken),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        final List<Product> products = [];
        if (jsonResponse.length == 0) {
          return products;
        }

        jsonResponse.forEach((product) {
          products.add(Product.fromJson(product));
        });

        await DefaultCacheManager().putFile(
            '$baseUrl/products?page_id=1&limit=10&category=${category.toLowerCase()}',
            Uint8List.fromList(response.body.codeUnits),
            fileExtension: 'json');

        return products;
      } else if (response.statusCode == 401) {
        return throw Exception('Unauthorized');
      } else {
        return throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
      return throw Exception(e);
    }
  }

  Future<List<Product>> getProductsCachedOrNot({
    String? category,
    dynamic acessToken,
  }) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(
          '$baseUrl/products?page_id=1&limit=10&category=${category?.toLowerCase()}');

      if (fileInfo != null && fileInfo.validTill.isAfter(DateTime.now())) {
        final products = await getProductsCached(
            category: category,
            acessToken: acessToken,
            baseUrl: baseUrl,
            fileInfo: fileInfo);
        return products;
      } else {
        final products = await getProductsUrl(
          category: category ?? '',
          acessToken: acessToken,
          baseUrl: baseUrl,
        );
        return products;
      }
    } catch (e) {
      print(e);
      return throw Exception(e);
    }
  }

  Future<List<Product>> getProducts({
    String? category,
    dynamic acessToken,
  }) async {
    try {
      final products = await getProductsCachedOrNot(
        category: category,
        acessToken: acessToken,
      );

      return products;
    } catch (e) {
      print(e);
      return throw Exception(e);
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
        return throw Exception("Failed to load products");
      }
    } catch (e) {
      return throw Exception(e);
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
      return throw Exception(e);
    }
  }

  Future<List<Product>> searchProduct(String query) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response =
          await http.get(Uri.parse('$baseUrl/products?query=$query'));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        final List<Product> products = [];
        jsonResponse['data'].forEach((product) {
          products.add(Product.fromJson(product));
        });
        return products;
      } else {
        return throw Exception("Failed to load products");
      }
    } catch (e) {
      return throw Exception(e);
    }
  }
}
