import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ProductListItem extends StatelessWidget {
  /// Displays a single [product] item in products list.
  ///
  /// [itemSize] is a size of item.
  const ProductListItem({
    required this.product,
    required this.itemSize,
    super.key,
  });

  final double itemSize;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final titleStyle =
        textStyle.headlineSmall?.copyWith(fontWeight: FontWeight.bold);
    final descriptionStyle = textStyle.titleMedium;
    final priceStyle = textStyle.displaySmall;

    final text = S.of(context);

    return Card(
      child: SizedBox(
        width: itemSize,
        height: itemSize * 1.1,
        child: Column(
          children: [
            Expanded(
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (_, __, ___) => Center(
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline),
                          Text(text.failed_to_load_image),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.title,
                      style: titleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.description,
                      style: descriptionStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _Rating(rating: product.rating),
                        Flexible(
                          child: Text(
                            '\$${product.price}',
                            style: priceStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.rating});

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final rateStyle = textStyle.titleSmall;
    final rateCountStyle = textStyle.titleSmall;

    final text = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.star),
            Text(
              rating.rate.toString(),
              style: rateStyle,
            ),
          ],
        ),
        Text(
          text.feedbacksAmount(rating.count),
          style: rateCountStyle,
        ),
      ],
    );
  }
}
