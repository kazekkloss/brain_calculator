import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: TextTheme(
      headline1: GoogleFonts.chakraPetch(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          shadows: [
            Shadow(
              offset: Offset(0, 0),
              blurRadius: 60,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
      headline2: GoogleFonts.robotoMono(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w300,
          shadows: [
            Shadow(
              offset: Offset(0, 0),
              blurRadius: 60,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
      headline3: GoogleFonts.robotoMono(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w400,
        ),
      ),
      headline4: GoogleFonts.robotoMono(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle1: GoogleFonts.robotoMono(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle2: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyText1: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 80, 92),
          fontWeight: FontWeight.w600,
        ),
      ),
      bodyText2: GoogleFonts.chakraPetch(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    ),
  );
}

class GradientContainer extends StatelessWidget {
  final Widget child;
  const GradientContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: child,
    );
  }
}

class Assets {
  static const badCalc = 'assets/animations/calculator_bad.riv';
  static const jumpCalc = 'assets/animations/calculator_splash.riv';
  static const homeCalc = 'assets/animations/calculator_home.riv';
  static const flagCalc = 'assets/animations/calculator_flag.riv';
  static const victoryCalc = 'assets/animations/calculator_victory.riv';
  static const okCalc = 'assets/animations/calculator_ok.riv';
}
