import 'package:calculator/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/calc/calc_bloc.dart';

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
                  //Navigator.pushNamed(context, '/test');
                  context.read<CalculationsBloc>().add(GetNumbersEasyEvent());
                  Navigator.pushNamed(context, '/count');
                },
                child: const Text('Easy')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/count');
                  context.read<CalculationsBloc>().add(GetNumbersMediumEvent());
                },
                child: const Text('Medium')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/count');
                  context.read<CalculationsBloc>().add(GetNumbersHardEvent());
                },
                child: const Text('Hard')),
          ],
        ),
      ),
    ));
  }
}
