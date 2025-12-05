import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../screen/product_list/product_list_screen.dart';

@RoutePage()
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) => const ProductListScreen();
}
