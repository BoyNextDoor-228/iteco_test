import '../../model/product/product.dart';

/// Abstract client, which describes methods for receiving data related to
/// [Product].
abstract class AbstractProductClient {
  /// Get a list of [Product]s.
  /// [limit] is maximum amount of received elements.
  Future<List<Product>> getProducts({int limit});

  /// Get a single [Product] by [productId].
  Future<Product> getProduct({required int productId});
}
