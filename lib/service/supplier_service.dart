import 'package:stock_store/models/product.dart';

import '../models/supplier.dart';
import '../repositories/supplier_repositories.dart';

class SupplierService {
  SupplierService._internal();

  static final SupplierService _singleton = SupplierService._internal();

  factory SupplierService() {
    return _singleton;
  }

  Future<List<Supplier>> getSuppliers({required String acessToken}) async {
    try {
      final suppliers = await SupplierRepositories().getSuppliers(
        acessToken: acessToken,
      );
      return suppliers;
    } catch (e) {
      return throw Exception('Failed to load suppliers $e');
    }
  }

  Future<Supplier> getSupplier(
    String id, {
    required String acessToken,
  }) async {
    try {
      final supplier = await SupplierRepositories().getSupplier(
        id,
        acessToken: acessToken,
      );
      return supplier;
    } catch (e) {
      return throw Exception('Failed to load supplier $e');
    }
  }

  Future<List<Product>> getProductBySupplierId(String id) async {
    try {
      final products = await SupplierRepositories().getProductBySupplierId(id);
      return products;
    } catch (e) {
      return throw Exception('Failed to load products $e');
    }
  }
}
