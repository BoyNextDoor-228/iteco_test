import 'package:domain/domain.dart';

/// Abstract client, which describes methods for getting [Product] related data.
abstract class ProductClient {
  Future<List<Product>> getProducts({int limit});

  Future<Product> getProduct({required int productId});
}
