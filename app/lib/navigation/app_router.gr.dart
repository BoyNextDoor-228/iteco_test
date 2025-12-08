// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [HomeRootPage]
class HomeRootRoute extends PageRouteInfo<void> {
  const HomeRootRoute({List<PageRouteInfo>? children})
      : super(HomeRootRoute.name, initialChildren: children);

  static const String name = 'HomeRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeRootPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    required VoidCallback onOnboardingPassed,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(
            onOnboardingPassed: onOnboardingPassed,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnboardingRouteArgs>();
      return OnboardingPage(
        onOnboardingPassed: args.onOnboardingPassed,
        key: args.key,
      );
    },
  );
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({required this.onOnboardingPassed, this.key});

  final VoidCallback onOnboardingPassed;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{onOnboardingPassed: $onOnboardingPassed, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OnboardingRouteArgs) return false;
    return onOnboardingPassed == other.onOnboardingPassed && key == other.key;
  }

  @override
  int get hashCode => onOnboardingPassed.hashCode ^ key.hashCode;
}

/// generated route for
/// [ProductListPage]
class ProductListRoute extends PageRouteInfo<void> {
  const ProductListRoute({List<PageRouteInfo>? children})
      : super(ProductListRoute.name, initialChildren: children);

  static const String name = 'ProductListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductListPage();
    },
  );
}

/// generated route for
/// [ProductRootPage]
class ProductRootRoute extends PageRouteInfo<void> {
  const ProductRootRoute({List<PageRouteInfo>? children})
      : super(ProductRootRoute.name, initialChildren: children);

  static const String name = 'ProductRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductRootPage();
    },
  );
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RootPage();
    },
  );
}
