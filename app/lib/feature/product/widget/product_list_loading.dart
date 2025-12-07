import 'package:flutter/material.dart';

import 'product_list_item_loading.dart';

class ProductListLoading extends StatefulWidget {
  const ProductListLoading.static({
    required this.itemSize,
    super.key,
  }) : controller = null;

  ProductListLoading.animated({
    required this.itemSize,
    super.key,
  }) : controller = ScrollController();

  final double itemSize;
  final ScrollController? controller;

  @override
  State<ProductListLoading> createState() => _ProductListLoadingState();
}

class _ProductListLoadingState extends State<ProductListLoading> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller?.animateTo(
        widget.controller!.position.maxScrollExtent,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        controller: widget.controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, __) =>
            ProductListItemLoading(itemSize: widget.itemSize),
      );
}
