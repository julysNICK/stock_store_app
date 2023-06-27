import '../models/product.dart';
import '../repositories/products_repositories.dart';

class ProductService {
  ProductService._internal();

  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  Future<List<Product>> getProducts({
    String? category,
    dynamic acessToken,
  }) async {
    try {
      final products = await ProductRepositories().getProducts(
        category: category,
        acessToken: acessToken,
      );
      return products;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<Product> getProduct(String id) async {
    try {
      final product = await ProductRepositories().getProduct(id);
      return product;
    } catch (e) {
      return throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> searchProduct(String query) async {
    try {
      final products = await ProductRepositories().searchProduct(query);
      return products;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
