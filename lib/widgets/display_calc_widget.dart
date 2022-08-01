import 'package:calculator/blocs/calc/calc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/async.dart';

class DisplayCalculationWidget extends StatefulWidget {
  const DisplayCalculationWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DisplayCalculationWidget> createState() =>
      _DisplayCalculationWidgetState();
}

class _DisplayCalculationWidgetState extends State<DisplayCalculationWidget> {
  int _start = 60;
  int _current = 60;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
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
    return Center(
      child: BlocBuilder<CalculationsBloc, CalculationsState>(
        builder: (context, state) {
          int numberOne = state.numberOne;
          String operatorOne = state.operatorOne;
          int numberTwo = state.numberTwo;
          String? operatorTwo = state.operatorTwo;
          int? numberThree = state.numberThree;
          String? operatorThree = state.operatorThree;
          int? numberFour = state.numberFour;
          int result = state.result;
          int score = state.score;
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
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
            child: SizedBox(
                height: 200,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 13),
                          child: Text('$_current'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Score $score',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                              child: numberFour == null
                                  ? numberThree == null
                                      ? Text('$numberOne '
                                          '$operatorOne '
                                          '$numberTwo')
                                      : Text('$numberOne '
                                          '$operatorOne '
                                          '$numberTwo '
                                          '$operatorTwo '
                                          '$numberThree')
                                  : Text('$numberOne '
                                      '$operatorOne '
                                      '$numberTwo '
                                      '$operatorTwo '
                                      '$numberThree '
                                      '$operatorThree '
                                      '$numberFour')),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(child: Text('$result')),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
