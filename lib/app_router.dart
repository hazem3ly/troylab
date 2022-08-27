import 'package:flutter/material.dart';

import 'core/view/router.dart';
import 'dashboard/view/router.dart';
import 'onboarding/splash.dart';

class AppRouter {
  AppRouter._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return CoreRouter.onGenerateRoute(routeSettings) ??
        HomeRouter.onGenerateRoute(routeSettings) ??

        //?This should never happen
        MaterialPageRoute(builder: (_) => const Splash());
  }
}
