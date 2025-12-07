import 'package:flutter/material.dart';

import '../../../product/widget/product_list_loading.dart';

class ProductListDemoSubpage extends StatefulWidget {
  const ProductListDemoSubpage({super.key});

  @override
  State<ProductListDemoSubpage> createState() => _ProductListDemoSubpageState();
}

class _ProductListDemoSubpageState extends State<ProductListDemoSubpage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final productListItemSize = MediaQuery.sizeOf(context).width;

    return Column(
      spacing: 30,
      children: [
        Text(
          'Бесконечный скролл продуктов!',
          style: textTheme.displaySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: ProductListLoading.animated(itemSize: productListItemSize),
        ),
      ],
    );
  }
}
