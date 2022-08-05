import 'package:flutter/material.dart';


class CustomTheme {
  gradientContainer(Widget widget) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1),
        colors: <Color>[
          Color.fromARGB(255, 0, 95, 95),
          Color.fromARGB(255, 19, 164, 0)
        ],
        tileMode: TileMode.mirror,
      )),
      child: widget,
    );
  }
}

class Assets {
  static const badCalc = 'assets/animations/kalkulator-bad.riv';
  static const jumpCalc = 'assets/animations/splash_screen_animation.riv';
}
