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
      final response = await http.post(Uri.parse('$baseUrl/stores/login'),
          body: jsonEncode({'email': email, 'password': password}));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        return Login_store.fromJson(jsonResponse);
      } else {
        return throw Exception('Failed to login verify your credentials');
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to login');
    }
  }

  Future<Store> createStore(String name, String address, String contactEmail,
      String contactPhone, String hashedPassword) async {
    print({
      'name': name,
      'address': address,
      'contact_email': contactEmail,
      'contact_phone': contactPhone,
      'hashed_password': hashedPassword
    });
    try {
      var baseUrl = 'http://192.168.0.69:8080';

      final response = await http.post(Uri.parse('$baseUrl/stores'),
          body: jsonEncode({
            'name': name,
            'address': address,
            'contact_email': contactEmail,
            'contact_phone': contactPhone,
            'hashed_password': hashedPassword
          }));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        return Store.fromJson(jsonResponse);
      } else {
        return throw Exception('Failed to create store in if');
      }
    } catch (e) {
      print(e);
      return throw Exception('Failed to create store');
    }
  }
}
