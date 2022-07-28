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
            result: 0,
            score: 0)) {
    on<NumberPressed>(_onNumberPressed);
    on<GetNumbersEasyEvent>(_getNumbersEasy);
    on<GetNumbersMediumEvent>(_getNumbersMedium);
    on<NegativeInt>(_convertToNegative);
  }

  Random random = Random();
  var listEasy = ['+', '-'];
  var listMedium = ['+', '-', '*'];
  bool check = false;

  void _getNumbersEasy(
      GetNumbersEasyEvent event, Emitter<CalculationsState> emit) {
    int randomNumber1 = random.nextInt(100);
    int randomNumber2 = random.nextInt(100);
    var element = listEasy[random.nextInt(listEasy.length)];
    int score = state.score;

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

    emit(CalculationsState(
        firstOperand: randomNumber1,
        firstOperator: element,
        secondOperand: randomNumber2,
        result: 00,
        score: score));
  }

  void _getNumbersMedium(
      GetNumbersMediumEvent event, Emitter<CalculationsState> emit) {
    int randomNumber1 = random.nextInt(100);
    int randomNumber2 = random.nextInt(100);
    var element1 = listMedium[random.nextInt(listMedium.length)];
    var element2 = listMedium[random.nextInt(listMedium.length)];
    int randomNumber3 = random.nextInt(100);
    var score = state.score;

    if (element1 == '*') {
      randomNumber2 = random.nextInt(10);
    }
    if (element2 == '*') {
      randomNumber3 = random.nextInt(10);
    }

    if (state.firstOperator == '-' && state.secondOperator == '-') {
      var result =
          state.firstOperand - state.secondOperand - state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '+' && state.secondOperator == '-') {
      var result =
          state.firstOperand + state.secondOperand - state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '+' && state.secondOperator == '+') {
      var result =
          state.firstOperand + state.secondOperand + state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '-' && state.secondOperator == '+') {
      var result =
          state.firstOperand - state.secondOperand + state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '*' && state.secondOperator == '+') {
      var result =
          state.firstOperand * state.secondOperand + state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '+' && state.secondOperator == '*') {
      var result =
          state.firstOperand + state.secondOperand * state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '*' && state.secondOperator == '-') {
      var result =
          state.firstOperand * state.secondOperand - state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '-' && state.secondOperator == '*') {
      var result =
          state.firstOperand - state.secondOperand * state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }
    if (state.firstOperator == '*' && state.secondOperator == '*') {
      var result =
          state.firstOperand * state.secondOperand * state.thirdOperand!;
      if (result == state.result) {
        score = state.score + 20;
      }
      if (state.score > 0) {
        score = state.score - 20;
      }
    }

    emit(CalculationsState(
        firstOperand: randomNumber1,
        firstOperator: element1,
        secondOperand: randomNumber2,
        secondOperator: element2,
        thirdOperand: randomNumber3,
        result: 0,
        score: score));
  }

  void _onNumberPressed(NumberPressed event, Emitter<CalculationsState> emit) {
    var number = event.number;

    if (state.result != 0) {
      number = int.parse('${state.result}${event.number}');
    }

    if (state.secondOperator == null) {
      emit(CalculationsState(
          firstOperand: state.firstOperand,
          firstOperator: state.firstOperator,
          secondOperand: state.secondOperand,
          result: number,
          score: state.score));
    }
    emit(CalculationsState(
        firstOperand: state.firstOperand,
        firstOperator: state.firstOperator,
        secondOperand: state.secondOperand,
        secondOperator: state.secondOperator,
        thirdOperand: state.thirdOperand,
        result: number,
        score: state.score));
  }

  void _convertToNegative(NegativeInt event, Emitter<CalculationsState> emit) {
    if (state.secondOperator == null) {
      emit(CalculationsState(
          firstOperand: state.firstOperand,
          firstOperator: state.firstOperator,
          secondOperand: state.secondOperand,
          result: -state.result.abs(),
          score: state.score));
    }

    emit(
      CalculationsState(
          firstOperand: state.firstOperand,
          firstOperator: state.firstOperator,
          secondOperand: state.secondOperand,
          secondOperator: state.secondOperator,
          thirdOperand: state.thirdOperand,
          result: -state.result.abs(),
          score: state.score),
    );
  }
}
