import 'dart:async';

import 'package:domain/domain.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../di/app_scope.dart';
import '../../api/product_rest_client.dart';
import 'product_list_screen.dart';
import 'product_list_screen_model.dart';

/// Default factory for [ProductListScreenWidgetModel]
ProductListScreenWidgetModel defaultProductListScreenWidgetModelFactory(
  BuildContext context,
) {
  final scope = context.read<IAppScope>();
  final restClient = ProductRestClient(scope.dio);
  final model = ProductListScreenModel(client: restClient);

  final productPaginationSize = scope.productPaginationSize;

  return ProductListScreenWidgetModel(
    model: model,
    productPaginationSize: productPaginationSize,
  );
}

/// Default widget model for ProductListScreen
class ProductListScreenWidgetModel
    extends WidgetModel<ProductListScreen, ProductListScreenModel>
    implements IProductListScreenWidgetModel {
  ProductListScreenWidgetModel({
    required ProductListScreenModel model,
    required this.productPaginationSize,
  }) : super(model);

  /// Size of portion of products for pagination.
  final int productPaginationSize;

  /// Scroll controller for Scrollable products list.
  ///
  /// Yes, it's a variable, as controllers will be recreated.
  var _controller = ScrollController();

  /// Scroll offset, which was reached on Scrollable List bottom.
  double _currentScrollOffset = 0;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _controller.addListener(_loadProductsWhenOnBottom);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_loadProductsWhenOnBottom)
      ..dispose();
    super.dispose();
  }

  @override
  ScrollController get controller => _controller;

  @override
  EntityValueListenable<List<Product>> get productListState =>
      model.productList;

  @override
  double get listItemSize => MediaQuery.sizeOf(context).width;

  @override
  Future<void> reloadProductList() => model.loadProductList(reload: true);

  /// Triggers loading of more products, when bottom of products list is reached.
  ///
  /// Works if:
  /// - state is not LoadingState;
  /// - There are some products to load still left.
  void _loadProductsWhenOnBottom() {
    _currentScrollOffset = _controller.position.pixels;
    if (model.productList.value.isLoadingState) {
      return;
    }

    const loadOffset = 10;
    if (_controller.offset + loadOffset >=
            _controller.position.maxScrollExtent &&
        model.hasMoreProducts) {
      final currentProductListLength =
          productListState.value.data?.toList().length;
      if (currentProductListLength == null) {
        return;
      }

      // When state changes, a different products list shows up, so I have to
      // keep scroll position updated.
      _updateController();

      unawaited(
        model.loadProductList(
          offset: currentProductListLength + productPaginationSize,
        ),
      );
    }
  }

  /// As there are two Scrollable Lists (for loading and completed states),
  /// they show up when corresponding state is happening.
  ///
  /// So once [ScrollController] of CompletedState has reached the bottom,
  /// state changes to LoadingState, which has to show it's own Scrollable List
  /// and so on.
  ///
  /// When Scrollable List of CompletedState get's changed by ScrollableList of
  /// LoadingState, I have to keep same offset of List. If not to do that,
  /// each time state changes, Scrollable List will be shown from it's beginning.
  ///
  /// By updating controller, I create a new one and set it's initialOffset to
  /// [_currentScrollOffset], so that Scrollable List saves it's position despite
  /// state changes.
  void _updateController() {
    _controller.removeListener(_loadProductsWhenOnBottom);
    _controller = ScrollController(initialScrollOffset: _currentScrollOffset);
    _controller.addListener(_loadProductsWhenOnBottom);
  }
}

abstract class IProductListScreenWidgetModel implements IWidgetModel {
  /// Listenable state of products list.
  EntityValueListenable<List<Product>> get productListState;

  /// Size of a single item in products list.
  double get listItemSize;

  /// Reloads products list.
  Future<void> reloadProductList();

  /// Scroll controller for scrollable products list.
  ScrollController get controller;
}
