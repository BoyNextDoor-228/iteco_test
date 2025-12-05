import 'package:domain/domain.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

import '../../../../app/widget/drawer.dart';
import '../../../../app/widget/error_information.dart';
import '../../widget/product_list.dart';
import 'product_list_widget_model.dart';

/// Screen, which displays list of [Product]s.
///
/// This class is the Widget of Elementary MWWM approach.
class ProductListScreen
    extends ElementaryWidget<IProductListScreenWidgetModel> {
  const ProductListScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultProductListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IProductListScreenWidgetModel wm) {
    const listPadding = EdgeInsets.symmetric(horizontal: 10);

    return Scaffold(
      appBar: AppBar(title: const Text('Product list')),
      drawer: const AppDrawer(),
      body: EntityStateNotifierBuilder<List<Product>>(
        listenableEntityState: wm.productListState,
        loadingBuilder: (_, previousProducts) => Padding(
          padding: listPadding,
          child: previousProducts == null
              ? const CircularProgressIndicator()
              : ProductList(
                  controller: wm.controller,
                  products: previousProducts,
                  onRefresh: wm.reloadProductList,
                ),
        ),
        errorBuilder: (_, __, ___) => ErrorInformation(
          errorDescription: 'Не получилось загрузить список продуктов.',
          buttonText: 'Повторить попытку',
          onButtonTap: () => wm.reloadProductList,
        ),
        builder: (_, products) => Padding(
          padding: listPadding,
          child: RefreshIndicator(
            onRefresh: wm.reloadProductList,
            child: ProductList(
              controller: wm.controller,
              products: products!,
              onRefresh: wm.reloadProductList,
            ),
          ),
        ),
      ),
    );
  }
}
