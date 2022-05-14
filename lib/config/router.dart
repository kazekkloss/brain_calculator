import 'package:calculator/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenereateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text('ERROR ROUTE'),
              ),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}
