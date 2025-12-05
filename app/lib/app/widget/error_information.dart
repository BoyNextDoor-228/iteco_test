import 'package:flutter/material.dart';

class ErrorInformation extends StatelessWidget {
  const ErrorInformation({
    required this.errorDescription,
    required this.buttonText,
    required this.onButtonTap,
    super.key,
  });

  final String errorDescription;
  final String buttonText;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final textStyle = textTheme.titleMedium;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          const Icon(
            Icons.mood_bad,
            size: 60,
          ),
          Text(
            textAlign: TextAlign.center,
            errorDescription,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
          OutlinedButton(
            onPressed: onButtonTap,
            child: Text(
              buttonText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
