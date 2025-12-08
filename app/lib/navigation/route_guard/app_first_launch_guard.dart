import 'package:auto_route/auto_route.dart';

import '../app_router.dart';

class AppFirstLaunchGuard extends AutoRouteGuard {
  /// Prevents from navigation, if user is not presented.
  const AppFirstLaunchGuard({required this.isFirstLaunch});

  final bool isFirstLaunch;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isFirstLaunch) {
      resolver.next();
    } else {
      // If it's first launch, I have to redirect user to OnboardingScreen.
      //ignore: discarded_futures
      resolver.redirectUntil(
        OnboardingRoute(
          onOnboardingPassed: () {
            resolver.next();
            router.removeLast();
          },
        ),
      );
    }
  }
}
