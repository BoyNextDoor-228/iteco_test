import 'package:flutter/material.dart';

import '../../text/informational_subpage_text.dart';
import 'informational_subpage.dart';

class LetsStartSubpage extends StatelessWidget {
  const LetsStartSubpage({
    required this.onButtonTap,
    super.key,
  });

  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: InformationalSubpage(
              icon: Icon(
                Icons.rocket_launch,
                size: 200,
                color: Theme.of(context).colorScheme.primary,
              ),
              titleText: 'Поехали!',
              informationText: letsStartText,
            ),
          ),
          FilledButton(
            onPressed: onButtonTap,
            child: const Text('Отправиться в приложение!'),
          ),
        ],
      );
}
