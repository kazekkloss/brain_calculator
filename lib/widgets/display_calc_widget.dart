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
  final int? answer;
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
    this.answer,
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
            color: const Color.fromARGB(255, 203, 203, 203),
            borderRadius: BorderRadius.circular(width / 15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 13,
                offset: Offset(-10, -10),
                color: Color.fromARGB(100, 0, 0, 0),
              ),
              BoxShadow(
                blurRadius: 13,
                offset: Offset(10, 10),
                color: Color.fromARGB(100, 0, 0, 0),
              )
            ]),
        child: SizedBox(
            height: height / 4,
            width: width / 1.15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 40),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                                width: height / 180,
                                color: const Color.fromARGB(255, 0, 111, 6))),
                        child: SizedBox(
                            height: height / 18,
                            width: height / 18,
                            child: Center(
                                child: timer > 10
                                    ? Text(
                                        timer.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: height / 32,
                                                color: Colors.black),
                                      )
                                    : Text(
                                        timer.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: height / 28,
                                                color: const Color.fromARGB(
                                                    255, 255, 0, 0)),
                                      ))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height / 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Score $score',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: height / 35),
                        ),
                        numberThree == null
                            ? Text(
                                '$numberOne '
                                '$operatorOne '
                                '$numberTwo',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: height / 30),
                              )
                            : Text(
                                '$numberOne '
                                '$operatorOne '
                                '$numberTwo '
                                '$operatorTwo '
                                '$numberThree',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: height / 30),
                              ),
                        Text(
                          '$result',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: height / 35),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: height/18,
                    child: Center(
                        child: answer != 0
                            ? Text(answer.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontSize: height / 42))
                            : const Text('')),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
