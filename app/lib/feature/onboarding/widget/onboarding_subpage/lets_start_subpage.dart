import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import 'informational_subpage.dart';

class LetsStartSubpage extends StatelessWidget {
  /// Last subpage for a [PageView], which ends onboarding process by calling
  /// [onButtonTap] callback.
  const LetsStartSubpage({
    required this.onButtonTap,
    super.key,
  });

  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final iconColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        Expanded(
          child: InformationalSubpage(
            icon: Icon(
              Icons.rocket_launch,
              size: 200,
              color: iconColor,
            ),
            titleText: text.lets_start_subpage_title,
            informationText: text.lets_start_subpage_information,
          ),
        ),
        FilledButton(
          onPressed: onButtonTap,
          child: Text(text.lets_start_subpage_button_text),
        ),
      ],
    );
  }
}
