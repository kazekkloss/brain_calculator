part of 'calc_bloc.dart';

class CalculationsState extends Equatable {
  final int firstOperand;
  final String firstOperator;
  final int secondOperand;
  final int result;
  final int score;
  const CalculationsState(
      {required this.firstOperator,
      required this.secondOperand,
      required this.firstOperand,
      required this.result,
      required this.score});

  @override
  List<Object> get props =>
      [firstOperand, firstOperator, secondOperand, result, score];
}