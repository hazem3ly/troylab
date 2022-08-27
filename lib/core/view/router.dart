import 'package:flutter/material.dart';

import '../../core/view/screens/service_not_available_screen.dart';
import 'screens/update_screen.dart';

class CoreRouter {
  CoreRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case UpdateScreen.id:
        return MaterialPageRoute(
          builder: (_) => const UpdateScreen(),
          settings: routeSettings,
        );
      case ServiceNotAvailableScreen.id:
        return MaterialPageRoute(
          builder: (_) => const ServiceNotAvailableScreen(),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
