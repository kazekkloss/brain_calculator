import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w400,
          shadows: [
            Shadow(
              offset: Offset(0, 0),
              blurRadius: 60,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
        headline2: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w300,
          fontSize: 24,
        ),
        headline3: TextStyle(
          color: Color(0xFF2B2E4A),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),);
}

class CustomTheme {
  gradientContainer(Widget widget) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1),
        colors: <Color>[
          Color.fromARGB(255, 0, 89, 137),
          Color.fromARGB(255, 19, 164, 0),
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
  static const homeCalc = 'assets/animations/kalkulator_home.riv';
}
