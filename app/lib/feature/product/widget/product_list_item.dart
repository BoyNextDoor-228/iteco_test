import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
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

    return Card(
      child: SizedBox(
        width: itemSize,
        height: itemSize * 1.1,
        child: Column(
          children: [
            const Expanded(
              child: Placeholder(),
              // child: Image.network(
              //   product.image,
              //   loadingBuilder: (_, __, ___) => const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              //   errorBuilder: (_, __, ___) => const Center(
              //     child: Column(
              //       children: [
              //         Icon(Icons.error_outline),
              //         Text('Не получилось загрузить изображение'),
              //       ],
              //     ),
              //   ),
              // ),
            ),
            Expanded(
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
          'Кол-во отзывов: ${rating.count}',
          style: rateCountStyle,
        ),
      ],
    );
  }
}
