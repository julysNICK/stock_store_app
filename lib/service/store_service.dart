import '../models/store.dart';
import '../repositories/store_repositories.dart';

class StoreService {
  StoreService._internal();

  static final StoreService _singleton = StoreService._internal();

  factory StoreService() {
    return _singleton;
  }

  Future<Login_store> loginStore(String email, String password) async {
    try {
      final store = await StoreRepositories().loginStore(email, password);
      return store;
    } catch (e) {
      return throw Exception('Failed to login');
    }
  }

  Future<Store> createStore(String name, String address, String contactEmail,
      String contactPhone, String hashedPassword) async {
    try {
      final store = await StoreRepositories().createStore(
          name, address, contactEmail, contactPhone, hashedPassword);
      return store;
    } catch (e) {
      return throw Exception('Failed to create store');
    }
  }
}
