import 'package:flutter/material.dart';

class DisplayCalculationWidget extends StatelessWidget {
  final int timer;
  final int numberOne;
  final String operatorOne;
  final int numberTwo;
  final String? operatorTwo;
  final int? numberThree;
  final String? operatorThree;
  final int? numberFour;
  final int result;
  final int score;
  const DisplayCalculationWidget({
    Key? key,
    required this.timer,
    required this.numberOne,
    required this.operatorOne,
    required this.numberTwo,
    this.operatorTwo,
    this.numberThree,
    this.operatorThree,
    this.numberFour,
    required this.result,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width / 15),
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
            height: height / 4,
            width: width / 1.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13, left: 13),
                      child: Text(timer.toString()),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height / 60),
                      child: Text(
                        'Score $score',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 30),
                      child: Center(
                          child: numberThree == null
                              ? Text('$numberOne '
                                  '$operatorOne '
                                  '$numberTwo')
                              : Text('$numberOne '
                                  '$operatorOne '
                                  '$numberTwo '
                                  '$operatorTwo '
                                  '$numberThree')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: Text('$result')),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            )),
      ),
    );
  }
}
