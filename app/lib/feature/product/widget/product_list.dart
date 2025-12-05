import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    required this.products,
    required this.controller,
    super.key,
  });

  final List<Product> products;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.sizeOf(context).width;

    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mood_bad),
            const Text(
                'Каталог продуктов пуст, возможно, он будет пополнен позже'),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Повторить попытку'),
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
