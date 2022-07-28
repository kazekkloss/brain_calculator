import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, '/levels',);
                },
                child: const Text('Start')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, '/score');
                },
                child: const Text('Score')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, '/settings');
                },
                child: const Text('Settings')),
          ],
        ),
      ),
    ));
  }
}
