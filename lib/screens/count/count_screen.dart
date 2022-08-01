import 'package:flutter/material.dart';

import '../../widgets/display_calc_widget.dart';
import '../../widgets/widgets.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);
  static const String routeName = '/count';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const CountScreen());
  }

  @override
  State<CountScreen> createState() => _CountScreenState();
}



class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 110, 200),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          DisplayCalculationWidget(),
          const SizedBox(
            height: 30,
          ),
          const KeyboardWidget(),
        ],
      ),
    );
  }
}
