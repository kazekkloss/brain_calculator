import 'package:flutter/material.dart';
import 'dart:async';

import 'package:calculator/screens/screens.dart';
import '../../config/config.dart';

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
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName, ModalRoute.withName('/home'))));
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: GradientContainer(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 5, bottom: height / 15),
                    child: Text(
                      'Brain\nCalculator',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: height / 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height / 2.4,
                    width: height / 2.4,
                    child: const RiveAnimation.asset(
                      Assets.jumpCalc,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
