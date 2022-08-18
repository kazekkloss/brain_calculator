part of 'calc_bloc.dart';

enum Levels { easy, medium, hard }

class CalculationsState extends Equatable {
  final int numberOne;
  final String operatorOne;
  final int numberTwo;
  final String? operatorTwo;
  final int? numberThree;
  final int result;
  final int answer;
  final int score;
  final Enum levels;
  const CalculationsState(
      {required this.numberOne,
      required this.operatorOne,
      required this.numberTwo,
      required this.answer,
      this.operatorTwo,
      this.numberThree,
      required this.result,
      required this.score,
      required this.levels});

  @override
  List<Object> get props =>
      [numberOne, operatorOne, answer, numberTwo, result, score];
}
