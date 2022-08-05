import 'package:flutter/material.dart';

import '../../blocs/blocs_export.dart';


class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  static const String routeName = '/levels';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const LevelsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            const Text('Levels Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counting_down',
                      arguments: Levels.easy);
                },
                child: const Text('Easy')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counting_down',
                      arguments: Levels.medium);
                },
                child: const Text('Medium')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counting_down',
                      arguments: Levels.hard);
                },
                child: const Text('Hard')),
          ],
        ),
      ),
    ));
  }
}
