import 'package:flutter/material.dart';

import 'product_list_item_loading.dart';

class ProductListLoading extends StatefulWidget {
  /// Creates a non-scrollable list, which was designed to be used as
  /// an indicator of loading of products list.
  ///
  /// Interaction with this list is not supposed.
  ///
  /// [itemSize] is a size of item.
  const ProductListLoading.static({
    required this.itemSize,
    super.key,
  })  : _controller = null,
        _itemCount = 3;

  /// Creates an auto-scrolling list, which was designed to be used as
  /// presentation of products list in loading state.
  ///
  /// Interaction with this list is not supposed.
  ///
  /// [itemSize] is a size of item.
  ProductListLoading.animated({
    required this.itemSize,
    super.key,
  })  : _controller = ScrollController(),
        _itemCount = 10;

  final double itemSize;
  final int _itemCount;
  final ScrollController? _controller;

  @override
  State<ProductListLoading> createState() => _ProductListLoadingState();
}

class _ProductListLoadingState extends State<ProductListLoading> {
  @override
  void initState() {
    super.initState();
    // Starting list animation, when list is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._controller?.animateTo(
        widget._controller!.position.maxScrollExtent,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    widget._controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        controller: widget._controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget._itemCount,
        itemBuilder: (_, __) =>
            ProductListItemLoading(itemSize: widget.itemSize),
      );
}
