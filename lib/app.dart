import 'package:calculator/screens/screens.dart';
import 'package:calculator/screens/testing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/calc/calc_bloc.dart';
import 'blocs/player/player_bloc.dart';
import 'config/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculationsBloc(),
        ),
        BlocProvider(
          create: (context) => PlayerBloc(),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRouter.onGenereateRoute,
        initialRoute: SplashScreen.routeName,
        //home: TestingScreen(),
      ),
    );
  }
}
