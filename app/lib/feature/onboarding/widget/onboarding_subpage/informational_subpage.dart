import 'package:flutter/material.dart';

class InformationalSubpage extends StatelessWidget {
  /// Subpage for [PageView], which displays some information.
  const InformationalSubpage({
    required this.icon,
    required this.titleText,
    required this.informationText,
    super.key,
  });

  final Icon icon;
  final String titleText;
  final String informationText;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: 30,
      children: [
        icon,
        Text(
          titleText,
          style: textTheme.displayMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              informationText,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}
