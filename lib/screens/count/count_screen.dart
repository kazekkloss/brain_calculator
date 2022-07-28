import 'package:calculator/blocs/calc/calc_bloc.dart';
import 'package:calculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

class CountScreen extends StatelessWidget {
  const CountScreen({Key? key}) : super(key: key);

  static const String routeName = '/count';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const CountScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationsBloc, CalculationsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 110, 200),
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),boxShadow: [
              BoxShadow(
                blurRadius: 13,
                offset: Offset(-10, -10),
                color: Color.fromARGB(255, 0, 57, 103),
              ),
              BoxShadow(
                blurRadius: 13,
                offset: Offset(10, 10),
                color: Color.fromARGB(255, 0, 57, 103),
              )
            ]),
                  child: const SizedBox(
                    height: 200,
                    width: 300,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const KeyboardWidget(),
            ],
          ),
        );
      },
    );
  }
}
