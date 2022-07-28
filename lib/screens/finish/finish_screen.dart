import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  static const String routeName = '/finish';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const FinishScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Finish screen'),
    ));
  }
}
