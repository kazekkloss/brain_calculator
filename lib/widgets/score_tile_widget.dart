import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/score_model.dart';

class ScoreTile extends StatelessWidget {
  final int number;
  final double height;
  final double width;
  final Score score;
  const ScoreTile({
    Key? key,
    required this.number,
    required this.score,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width / 40),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(86, 255, 255, 255),
          borderRadius: BorderRadius.circular(height / 50),
        ),
        child: SizedBox(
            child: Padding(
          padding: EdgeInsets.all(height / 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(180, 255, 255, 255),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 4,
                        color: const Color.fromARGB(255, 14, 163, 0),
                      )),
                  child: SizedBox(
                      height: height / 25,
                      width: height / 25,
                      child: Center(
                          child: Text(
                        number.toString(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: height / 45,
                            color: const Color.fromARGB(255, 14, 163, 0)),
                      )))),
              SizedBox(
                width: width/7,
                child: Center(
                  child: Text(score.points.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: height / 35)),
                ),
              ),
              SizedBox(
                width: width/4,
                child: Center(
                  child: Text(score.level,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: height / 50)),
                ),
              ),
              SizedBox(
                width: width/3.2,
                child: Center(
                  child: Text(
                      DateFormat().add_yMd().add_Hm().format(
                            DateTime.parse(score.date),
                          ),
                      style: Theme.of(context).textTheme.subtitle2!),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
