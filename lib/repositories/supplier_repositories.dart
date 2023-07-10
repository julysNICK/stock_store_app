import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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

  Future<List<Supplier>> getSuppliersCached({
    required String acessToken,
    required String baseUrl,
    required FileInfo? fileInfo,
  }) async {
    try {
      var cachedResponse = await DefaultCacheManager()
          .getSingleFile('$baseUrl/suppliers?page_id=1&limit=10');
      var jsonResponse = jsonDecode(await cachedResponse.readAsString());

      final List<Supplier> suppliers = [];

      if (jsonResponse.length == 0) {
        return suppliers;
      }

      jsonResponse.forEach((supplier) {
        suppliers.add(Supplier.fromJson(supplier));
      });

      return suppliers;
    } catch (e) {
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<List<Supplier>> getSuppliersFn({
    required String acessToken,
    required String baseUrl,
  }) async {
    try {
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

        await DefaultCacheManager().putFile(
          '$baseUrl/suppliers?page_id=1&limit=10',
          Uint8List.fromList(response.body.codeUnits),
          fileExtension: '.json',
          maxAge: const Duration(days: 7),
        );

        return suppliers;
      } else if (response.statusCode == 401) {
        return throw Exception('Unauthorized');
      } else {
        return throw Exception('Failed to load suppliers $response');
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<List<Supplier>> getSuppliersCachedOrNot({
    required String acessToken,
    required String baseUrl,
  }) async {
    try {
      FileInfo? fileInfo = await DefaultCacheManager()
          .getFileFromCache('$baseUrl/suppliers?page_id=1&limit=10');

      if (fileInfo != null && fileInfo.validTill.isAfter(DateTime.now())) {
        final suppliers = await getSuppliersCached(
          acessToken: acessToken,
          baseUrl: baseUrl,
          fileInfo: fileInfo,
        );

        return suppliers;
      } else {
        final suppliers = await getSuppliersFn(
          acessToken: acessToken,
          baseUrl: baseUrl,
        );

        return suppliers;
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<List<Supplier>> getSuppliers({required String acessToken}) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      final suppliers = await getSuppliersCachedOrNot(
        acessToken: acessToken,
        baseUrl: baseUrl,
      );

      return suppliers;
    } catch (e) {
      print(e);
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

  Future<List<Product>> getProductBySupplierIdCached(
      {required String id, required String baseUrl}) async {
    try {
      var cachedResponse = await DefaultCacheManager()
          .getSingleFile('$baseUrl/products/supplier/$id?page_id=1&limit=10');

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
      return throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductBySupplierIdCallApi(
      {required String id, required String baseUrl}) async {
    try {
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

  Future<List<Product>> getProductBySupplierIdApiorCached({
    required String id,
    required String baseUrl,
  }) async {
    try {
      FileInfo? fileInfo = await DefaultCacheManager().getFileFromCache(
          '$baseUrl/products/supplier/$id?page_id=1&limit=10');

      if (fileInfo != null && fileInfo.validTill.isAfter(DateTime.now())) {
        final products = await getProductBySupplierIdCached(
          id: id,
          baseUrl: baseUrl,
        );

        return products;
      } else {
        final products = await getProductBySupplierIdCallApi(
          id: id,
          baseUrl: baseUrl,
        );

        return products;
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<List<Product>> getProductBySupplierId(String id) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      final products = await getProductBySupplierIdApiorCached(
        id: id,
        baseUrl: baseUrl,
      );

      return products;
    } catch (e) {
      print(e);
      return throw Exception('Failed to load products');
    }
  }
}
