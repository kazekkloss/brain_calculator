part of 'calc_bloc.dart';

class CalculationsState extends Equatable {
  final int numberOne;
  final String operatorOne;
  final int numberTwo;
  final String? operatorTwo;
  final int? numberThree;
  final String? operatorThree;
  final int? numberFour;
  final int result;
  final int score;
  const CalculationsState(
      {required this.numberOne,
      required this.operatorOne,
      required this.numberTwo,
      this.operatorTwo,
      this.numberThree,
      this.operatorThree,
      this.numberFour,
      required this.result,
      required this.score});

  @override
  List<Object> get props => [numberOne, operatorOne, numberTwo, result, score];
}
