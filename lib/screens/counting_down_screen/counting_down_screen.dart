import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import 'package:calculator/blocs/blocs_export.dart';

import '../../config/config.dart';

class CountingDownScreen extends StatefulWidget {
  final Enum levels;
  const CountingDownScreen({Key? key, required this.levels}) : super(key: key);

  static const String routeName = '/counting_down';

  static Route route({required Enum levels}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: ((context) => CountingDownScreen(
              levels: levels,
            )));
  }

  @override
  State<CountingDownScreen> createState() => _CountingDownScreenState();
}

class _CountingDownScreenState extends State<CountingDownScreen> {
  final int _start = 3;
  int _current = 3;

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
      if (widget.levels == Levels.easy) {
        context.read<CalculationsBloc>().add(GetNumbersEasyEvent());
        Navigator.pushNamed(context, '/count');
      }
      if (widget.levels == Levels.medium) {
        context.read<CalculationsBloc>().add(GetNumbersMediumEvent());
        Navigator.pushNamed(context, '/count');
      }
      if (widget.levels == Levels.hard) {
        context.read<CalculationsBloc>().add(GetNumbersHardEvent());
        Navigator.pushNamed(context, '/count');
      }
      sub.cancel();
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: const RiveAnimation.asset(
            Assets.homeCalc,
            fit: BoxFit.cover,
          ),
          //child: Text(
          //'$_current',
          //style: const TextStyle(fontSize: 100),
          //),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
