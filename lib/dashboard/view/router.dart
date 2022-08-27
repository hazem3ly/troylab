import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class HomeRouter {
  HomeRouter._();
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
