import 'dart:async';

import 'package:domain/domain.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';

import '../../api/product_client.dart';

class ProductListScreenModel extends ElementaryModel {
  ProductListScreenModel({required ProductClient client, super.errorHandler})
      : _client = client;

  final ProductClient _client;

  List<Product> _allReceivedProducts = [];
  List<Product> _paginatedProducts = [];

  late bool _hasMoreProducts;

  bool get hasMoreProducts => _hasMoreProducts;

  final productList = EntityStateNotifier<List<Product>>();

  @override
  void init() {
    unawaited(loadProductList(reload: true));
  }

  Future<void> loadProductList({bool reload = false, int offset = 3}) async {
    productList.loading(reload ? null : _paginatedProducts);

    try {
      // As FakeStoreAPI doesn't provide 'offset' query-parameter for
      // pagination, I have to simulate a pagination.
      // To do so, I receive all data, which API sends, and manually divide it
      // into pieces, so that each piece is a piece, which would be sent by API,
      // if it had 'offset' parameter.

      if (reload) {
        _hasMoreProducts = true;
        // First, I get whe whole products list from API.
        _allReceivedProducts = await _client.getProducts();
      }
      // Artificial delay to imitate network loading.
      await Future.delayed(const Duration(seconds: 1));

      // Second, I keep only those products, which are within offset.
      _paginatedProducts = _allReceivedProducts.take(offset).toList();

      if (_paginatedProducts.length == _allReceivedProducts.length) {
        _hasMoreProducts = false;
      }

      productList.content(_paginatedProducts);
    } on Exception catch (e, s) {
      handleError(e, stackTrace: s);
      productList.error(e);
    }
  }
}
