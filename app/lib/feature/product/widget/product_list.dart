import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'product_list_item.dart';

class ProductList extends StatelessWidget {
  /// Creates a scrollable list, which displays [products].
  ///
  /// Scroll behaviour controlled by [controller].
  /// [onRefresh] is a callback, which is called on refresh button tap.
  const ProductList({
    required this.products,
    required this.controller,
    required this.onRefresh,
    super.key,
  });

  /// [List] of [Product]s, which this widget has to display.
  final List<Product> products;

  /// Controller of scrollable list.
  final ScrollController controller;

  /// Callback, which is called on refresh button tap.
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.sizeOf(context).width;
    final text = S.of(context);

    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mood_bad),
            Text(
              text.product_list_absence_text,
            ),
            OutlinedButton(
              onPressed: onRefresh,
              child: Text(text.empty_product_list_reload_button_text),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(
        height: 30,
      ),
      itemBuilder: (_, index) => ProductListItem(
        product: products[index],
        itemSize: itemSize,
      ),
    );
  }
}
