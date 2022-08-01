import 'dart:async';

import 'package:calculator/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../blocs/player/player_bloc.dart';
import '../testing_screen.dart';

const riveFile = 'assets/animations/splash_screen_animation.riv';

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
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        Timer(
            const Duration(seconds: 3),
            (() => state.player.name == ''
                ? Navigator.of(context).pushNamedAndRemoveUntil(
                    TestingScreen.routeName, ModalRoute.withName('/test'))
                : Navigator.of(context).pushNamedAndRemoveUntil(
                    HomeScreen.routeName, ModalRoute.withName('/home'))));
        return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: Center(
                child: Column(
                  children: const [
                    SizedBox(height: 100),
                    Text(
                      '',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Play',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 64, 213, 0)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 400,
                      width: 400,
                      child: RiveAnimation.asset(
                        riveFile,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
