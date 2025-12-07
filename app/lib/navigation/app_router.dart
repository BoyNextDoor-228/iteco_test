import 'package:auto_route/auto_route.dart';

import '../feature/home/home_page.dart';
import '../feature/home/home_root_page.dart';
import '../feature/onboarding/page/onboarding_page.dart';
import '../feature/onboarding/page/onboarding_root_page.dart';
import '../feature/product/page/product_list_page.dart';
import '../feature/product/page/product_root_page.dart';
import '../feature/root/root_page.dart';
import 'route_path.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePath.root,
          page: RootRoute.page,
          children: [
            RedirectRoute(
              path: '',
              redirectTo: RoutePath.onboarding,
            ),
            AutoRoute(
              path: RoutePath.onboarding,
              page: OnboardingRootRoute.page,
              children: [
                RedirectRoute(
                  path: '',
                  redirectTo: RoutePath.onboarding,
                ),
                AutoRoute(
                  path: RoutePath.onboarding,
                  page: OnboardingRoute.page,
                ),
              ],
            ),
            // ==============================
            AutoRoute(
              path: RoutePath.home,
              page: HomeRootRoute.page,
              children: [
                RedirectRoute(
                  path: '',
                  redirectTo: RoutePath.home,
                ),
                AutoRoute(
                  path: RoutePath.home,
                  page: HomeRoute.page,
                ),
              ],
            ),
            // ==============================
            AutoRoute(
              path: RoutePath.productList,
              page: ProductRootRoute.page,
              children: [
                RedirectRoute(
                  path: '',
                  redirectTo: RoutePath.productList,
                ),
                AutoRoute(
                  path: RoutePath.productList,
                  page: ProductListRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
