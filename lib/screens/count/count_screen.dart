import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'package:quiver/iterables.dart';

import '../../blocs/blocs_export.dart';

import '../../config/config.dart';
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
  Timer? _countDownTimer;
  Duration _duration = const Duration(seconds: 60);

  void _setCountDown() {
    const reduce = 1;
    setState(() {
      final _seconds = _duration.inSeconds - reduce;
      if (_seconds < 0) {
        _countDownTimer!.cancel();
        Navigator.pushNamed(context, '/finish');
      } else {
        _duration = Duration(seconds: _seconds);
      }
    });
  }

  @override
  void initState() {
    context.read<CalculationsBloc>().add(ClearScoreEvent());
    _countDownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => _setCountDown());
    print('init');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    _countDownTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationsBloc, CalculationsState>(
      builder: (context, state) {
        var height = MediaQuery.of(context).size.height;
        final seconds = _duration.inSeconds.toInt();
        return WillPopScope(
          child: Scaffold(
            body: GradientContainer(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 18, bottom: height / 60),
                    child: DisplayCalculationWidget(
                      numberOne: state.numberOne,
                      operatorOne: state.operatorOne,
                      numberTwo: state.numberTwo,
                      operatorTwo: state.operatorTwo,
                      numberThree: state.numberThree,
                      result: state.result,
                      answer: state.answer,
                      score: state.score,
                      timer: seconds,
                    ),
                  ),
                  const KeyboardWidget(),
                ],
              ),
            ),
          ),
          onWillPop: () async {
            return false;
          },
        );
      },
    );
  }
}
