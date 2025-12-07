import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../screen/onboarding_screen.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => const OnboardingScreen();
}
