import 'package:flutter/material.dart';

import '../screens/user/home_screen.dart';

import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rHomeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}
