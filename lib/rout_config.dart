import 'package:auto_route/auto_route.dart';

import 'rout_config.gr.dart';

/// The route configuration.
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        RedirectRoute(path: '/', redirectTo: '/dashboard'),
        AutoRoute(
          path: '/dashboard',
          page: HomeRoute.page,
          children: [
            AutoRoute(path: 'details', page: DetailsRoute.page),
            AutoRoute(path: 'tabOne', page: TabOneRoute.page),
            AutoRoute(path: 'tabTwo', page: TabTwoRoute.page),
            AutoRoute(path: 'tabThree', page: TabThreeRoute.page),
          ],
        ),
        AutoRoute(path: '/details2', page: DetailsRoute.page)
      ];
}
