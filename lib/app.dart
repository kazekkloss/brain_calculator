import 'package:flutter/material.dart';

import 'config/config.dart';
import 'screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRouter.onGenereateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}