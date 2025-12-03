import '../../model/product/product.dart';

abstract class AbstractProductClient {
  Future<List<Product>> getProducts({required int limit});

  Future<Product> getProduct({required int productId});
}
