import 'package:calculator/screens/screens.dart';
import 'package:calculator/screens/testing_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenereateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LevelsScreen.routeName:
        return LevelsScreen.route();
      case CountScreen.routeName:
        return CountScreen.route();
      case TestingScreen.routeName:
        return TestingScreen.route();
      case FinishScreen.routeName:
        return FinishScreen.route();
      case SettingsScreen.routeName:
        return SettingsScreen.route();
      case ScoreScreen.routeName:
        return ScoreScreen.route();
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
