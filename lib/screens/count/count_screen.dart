import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import '../../blocs/blocs_export.dart';

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
  final int _start = 60;
  int _current = 60;

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      Navigator.pushNamed(context, '/finish');
    });
  }

  @override
  void initState() {
    context.read<CalculationsBloc>().add(ClearScoreEvent());
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationsBloc, CalculationsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 110, 200),
          body: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              DisplayCalculationWidget(
                numberOne: state.numberOne,
                operatorOne: state.operatorOne,
                numberTwo: state.numberTwo,
                operatorTwo: state.operatorTwo,
                numberThree: state.numberThree,
                operatorThree: state.operatorThree,
                numberFour: state.numberFour,
                result: state.result,
                score: state.score,
                timer: _current,
              ),
              const SizedBox(
                height: 30,
              ),
              const KeyboardWidget(),
            ],
          ),
        );
      },
    );
  }
}
