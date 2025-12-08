import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../screen/onboarding_screen.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({required this.onOnboardingPassed, super.key});

  /// [onOnboardingPassed] is a callback, which is called, when user passes
  /// onboarding.
  final VoidCallback onOnboardingPassed;

  @override
  Widget build(BuildContext context) => OnboardingScreen(
        onOnboardingPassed: onOnboardingPassed,
      );
}
