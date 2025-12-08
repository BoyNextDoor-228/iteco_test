import 'dart:async';

import 'package:domain/domain.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';

/// This class is the Model of Elementary MWWM approach.
class ProductListScreenModel extends ElementaryModel {
  /// Creates a Model for ProductListScreen.
  ///
  /// [client] is a Client, which is responsible for getting [Product] related
  /// data.
  ProductListScreenModel({
    required AbstractProductClient client,
    super.errorHandler,
  }) : _client = client;

  /// A client, which can get [Product] related data.
  final AbstractProductClient _client;

  /// As FakeStoreAPI doesn't provide 'offset' query-parameter for
  /// pagination, I have to receive all available products and then simulate
  /// a pagination.
  /// To do so, I receive all products, which API has ([_allReceivedProducts]),
  /// and manually divide it into pieces, so that each piece is a piece,
  /// which would be sent by API, if it had 'offset' parameter.
  List<Product> _allReceivedProducts = [];

  /// List of products, which are currently received, using fake pagination.
  List<Product> _paginatedProducts = [];

  /// Determines, if there are no products to get left.
  late bool _hasMoreProducts;

  /// Public getter of [_hasMoreProducts].
  bool get hasMoreProducts => _hasMoreProducts;

  /// Notifier, which is used as state of product list.
  final productList = EntityStateNotifier<List<Product>>();

  @override
  void init() {
    unawaited(loadProductList(reload: true));
  }

  /// Loads products and updates state.
  ///
  /// If data is going to be loaded for the first time, pass true in [reload].
  /// Same if you're going to reload list.
  ///
  /// [offset] is imitation of a real 'offset' query parameter.
  Future<void> loadProductList({bool reload = false, int offset = 3}) async {
    // If it's reload or first loading, no previous data exists, else
    // loading state has to know, what data there was before this state happened.
    productList.loading(reload ? null : _paginatedProducts);

    try {
      // If it's reload or first loading
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
