import 'package:flutter/material.dart';

class ProductListItemLoading extends StatefulWidget {
  /// Displays a single item in products list with shimmer effect, which means
  /// this item is now loading.
  ///
  /// [itemSize] is a size of item.
  const ProductListItemLoading({
    required this.itemSize,
    this.animationDuration = Durations.extralong4,
    this.animationCurve = Curves.bounceInOut,
    super.key,
  });

  final double itemSize;

  final Duration animationDuration;
  final Curve animationCurve;

  @override
  State<ProductListItemLoading> createState() => _ProductListItemLoadingState();
}

class _ProductListItemLoadingState extends State<ProductListItemLoading>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late final Animation<double> _loadingColorOpacity;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );

    _loadingColorOpacity = Tween<double>(
      begin: 0.1,
      end: 0.2,
    ).animate(curvedAnimation);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final loadingDataColor = Theme.of(context).colorScheme.onSurface;

    // 24 is default size of headlineSmall style, according to Material Design.
    final titleFontSize = textStyle.headlineSmall?.fontSize ?? 24;
    // 16 is default size of titleMedium style, according to Material Design.
    final descriptionFontSize = textStyle.titleMedium?.fontSize ?? 16;
    // 48 is default size of displaySmall style, according to Material Design.
    final priceFontSize = textStyle.displaySmall?.fontSize ?? 48;
    // 14 is default size of titleSmall style, according to Material Design.
    final rateFontSize = textStyle.titleSmall?.fontSize ?? 14;
    final rateCountFontSize = rateFontSize;

    return Card(
      child: SizedBox(
        width: widget.itemSize,
        height: widget.itemSize * 1.1,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, __) => Column(
            children: [
              Expanded(
                child: ColoredBox(
                  color: loadingDataColor.withValues(
                    alpha: _loadingColorOpacity.value,
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _LoadingContainer(
                        height: titleFontSize,
                        width: widget.itemSize * 0.9,
                        color: loadingDataColor.withValues(
                          alpha: _loadingColorOpacity.value,
                        ),
                      ),
                      _LoadingContainer(
                        height: descriptionFontSize * 3,
                        // 3 lines of description
                        width: widget.itemSize * 0.9,
                        color: loadingDataColor.withValues(
                          alpha: _loadingColorOpacity.value,
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _LoadingRating(
                            rateFontSize: rateFontSize,
                            rateCountFontSize: rateCountFontSize,
                            containerWidth: widget.itemSize * 0.1,
                            containerColor: loadingDataColor.withValues(
                              alpha: _loadingColorOpacity.value,
                            ),
                          ),
                          Flexible(
                            child: _LoadingContainer(
                              height: priceFontSize,
                              width: widget.itemSize * 0.4,
                              color: loadingDataColor.withValues(
                                alpha: _loadingColorOpacity.value,
                              ),
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
      ),
    );
  }
}

class _LoadingContainer extends StatelessWidget {
  const _LoadingContainer({
    required this.height,
    required this.width,
    required this.color,
  });

  final double height;
  final double width;

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      );
}

class _LoadingRating extends StatelessWidget {
  const _LoadingRating({
    required this.rateFontSize,
    required this.rateCountFontSize,
    required this.containerWidth,
    required this.containerColor,
  });

  final double rateFontSize;
  final double rateCountFontSize;

  final double containerWidth;
  final Color containerColor;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star),
              _LoadingContainer(
                height: rateFontSize,
                width: containerWidth,
                color: containerColor,
              ),
            ],
          ),
          _LoadingContainer(
            height: rateCountFontSize,
            width: containerWidth,
            color: containerColor,
          ),
        ],
      );
}
