import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calc_event.dart';
part 'calc_state.dart';


class CalculationsBloc extends Bloc<CalculationsEvent, CalculationsState> {
  CalculationsBloc()
      : super(const CalculationsState(
            firstOperand: 00,
            firstOperator: '',
            secondOperand: 00,
            result: 00,
            score: 0)) {
    on<NumberPressed>(_onNumberPressed);
    on<CalculationsResult>(_getNumbers);
    on<NegativeInt>(_convertToNegative);
  }

  Random random = Random();
  var list = ['+', '-'];
  bool check = false;

  void _getNumbers(CalculationsResult event, Emitter<CalculationsState> emit) {
    int randomNumber1 = random.nextInt(100);
    int randomNumber2 = random.nextInt(100);
    var element = list[random.nextInt(list.length)];
    int score = state.score;

    if (state.firstOperand != 00) {
      if (state.firstOperator == '+') {
        var result = state.firstOperand + state.secondOperand;
        if (result == state.result) {
          score = state.score + 10;
        } else {
          if (state.score > 0) {
            score = state.score - 10;
          }
        }
      }
      if (state.firstOperator == '-') {
        var result = state.firstOperand - state.secondOperand;
        if (result == state.result) {
          score = state.score + 10;
        } else {
          if (state.score > 0) {
            score = state.score - 10;
          }
        }
      }
    }

    emit(CalculationsState(
        firstOperand: randomNumber1,
        firstOperator: element,
        secondOperand: randomNumber2,
        result: 00,
        score: score));
  }

  void _onNumberPressed(NumberPressed event, Emitter<CalculationsState> emit) {
    var number = event.number;

    if (state.result != 0) {
      number = int.parse('${state.result}${event.number}');
    }

    emit(CalculationsState(
        firstOperand: state.firstOperand,
        firstOperator: state.firstOperator,
        secondOperand: state.secondOperand,
        result: number,
        score: state.score));
  }

  void _convertToNegative(NegativeInt event, Emitter<CalculationsState> emit) {
    emit(
      CalculationsState(
          firstOperand: state.firstOperand,
          firstOperator: state.firstOperator,
          secondOperand: state.secondOperand,
          result: -state.result.abs(),
          score: state.score),
    );
    if (-state.result.abs() == 00) {
      print('negative');
    }
  }
}
