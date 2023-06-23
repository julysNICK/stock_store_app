import 'dart:convert';

import 'package:stock_store/models/product.dart';

import '../models/supplier.dart';
import 'package:http/http.dart' as http;

class SupplierRepositories {
  SupplierRepositories._internal();

  static final SupplierRepositories _singleton =
      SupplierRepositories._internal();

  factory SupplierRepositories() {
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

  Future<List<Supplier>> getSuppliers({required String acessToken}) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.get(
        Uri.parse('$baseUrl/suppliers?page_id=1&limit=10'),
        headers: returnHeader(acessToken),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        final List<Supplier> suppliers = [];
        if (jsonResponse.length == 0) {
          return suppliers;
        }

        jsonResponse.forEach((supplier) {
          suppliers.add(Supplier.fromJson(supplier));
        });

        return suppliers;
      } else {
        return throw Exception('Failed to load suppliers $response');
      }
    } catch (e) {
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<Supplier> getSupplier(
    String id, {
    required String acessToken,
  }) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.get(
        Uri.parse('$baseUrl/suppliers/$id'),
        headers: returnHeader(acessToken),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return Supplier.fromJson(jsonResponse);
      } else {
        return throw Exception('Failed to load suppliers');
      }
    } catch (e) {
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<List<Product>> getProductBySupplierId(String id) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      final response = await http
          .get(Uri.parse('$baseUrl/products/supplier/$id?page_id=1&limit=10'));
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
}
