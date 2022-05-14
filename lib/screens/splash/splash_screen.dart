import 'dart:async';

import 'package:calculator/screens/screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: ((context) => const SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        (() => Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName, ModalRoute.withName('/home'))));
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          body: Center(
            child: Text('splash screen'),
          ),
        ));
  }
}
