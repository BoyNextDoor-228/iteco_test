import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:retrofit/retrofit.dart';

part 'product_rest_client.g.dart';

@RestApi()
abstract class ProductRestClient implements AbstractProductClient {
  /// Rest API implementation of [AbstractProductClient].
  factory ProductRestClient(
    Dio dio, {
    String baseUrl,
  }) = _ProductRestClient;

  @override
  @GET('/products/{productId}')
  Future<Product> getProduct({
    @Path() required int productId,
  });

  @override
  @GET('/products')
  Future<List<Product>> getProducts({
    @Query('limit') int limit,
  });
}
