import 'dart:convert';

import '../models/store.dart';
import 'package:http/http.dart' as http;

class StoreRepositories {
  StoreRepositories._internal();

  static final StoreRepositories _singleton = StoreRepositories._internal();

  factory StoreRepositories() {
    return _singleton;
  }

  String returnError(String error) {
    return error;
  }

  Future<Login_store> loginStore(String email, String password) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';
      final response = await http.post(Uri.parse('$baseUrl/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return Login_store.fromJson(jsonResponse["login"]);
      } else {
        return throw Exception('Failed to login verify your credentials');
      }
    } catch (e) {
      return throw Exception('Failed to login');
    }
  }

  Future<Store> createStore(String name, String address, String contactEmail,
      String contactPhone, String hashedPassword) async {
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      final response = await http.post(Uri.parse('$baseUrl/store'), body: {
        'name': name,
        'address': address,
        'contact_email': contactEmail,
        'contact_phone': contactPhone,
        'hashed_password': hashedPassword
      });

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        return Store.fromJson(jsonResponse["store"]);
      } else {
        return throw Exception('Failed to create store');
      }
    } catch (e) {
      return throw Exception('Failed to create store');
    }
  }
}
