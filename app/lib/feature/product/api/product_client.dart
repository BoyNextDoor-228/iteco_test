import 'package:domain/domain.dart';

abstract class ProductClient {
  Future<List<Product>> getProducts({int limit});

  Future<Product> getProduct({required int productId});
}
