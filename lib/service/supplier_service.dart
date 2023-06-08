import '../models/supplier.dart';
import '../repositories/supplier_repositories.dart';

class SupplierService {
  SupplierService._internal();

  static final SupplierService _singleton = SupplierService._internal();

  factory SupplierService() {
    return _singleton;
  }

  Future<List<Supplier>> getSuppliers() async {
    try {
      final suppliers = await SupplierRepositories().getSuppliers();
      return suppliers;
    } catch (e) {
      return throw Exception('Failed to load suppliers');
    }
  }

  Future<Supplier> getSupplier(String id) async {
    try {
      final supplier = await SupplierRepositories().getSupplier(id);
      return supplier;
    } catch (e) {
      return throw Exception('Failed to load supplier');
    }
  }
}
