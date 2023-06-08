import 'dart:convert';

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

  Future<List<Supplier>> getSuppliers() async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.get(Uri.parse('$baseUrl/suppliers'));

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
        return throw Exception('Failed to load suppliers');
      }
    } catch (e) {
      return throw Exception('Failed to load suppliers');
    }
  }

  Future<Supplier> getSupplier(String id) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.get(Uri.parse('$baseUrl/suppliers/$id'));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return Supplier.fromJson(jsonResponse["supplier"]);
      } else {
        return throw Exception('Failed to load suppliers');
      }
    } catch (e) {
      return throw Exception('Failed to load suppliers');
    }
  }
}
