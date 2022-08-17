import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import 'package:calculator/blocs/blocs_export.dart';

import '../../config/config.dart';
import '../../widgets/widgets.dart';

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      child: Scaffold(
        body: GradientContainer(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: height / 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TickerWidget(height: height, current: _current),
                  SizedBox(
                    height: height / 2.4,
                    width: width,
                    child: const RiveAnimation.asset(
                      Assets.flagCalc,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}

