import 'package:flutter/material.dart';

import 'package:calculator/blocs/blocs_export.dart';
import 'package:calculator/config/config.dart';
import 'package:calculator/screens/screens.dart';

class BrainCaclculator extends StatelessWidget {
  const BrainCaclculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculationsBloc(),
        ),
        BlocProvider(
          create: (context) => ScoreBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenereateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
