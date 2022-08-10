import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'dart:math';

part 'calc_event.dart';
part 'calc_state.dart';

class CalculationsBloc extends Bloc<CalculationsEvent, CalculationsState> {
  CalculationsBloc()
      : super(const CalculationsState(
            numberOne: 00,
            operatorOne: '',
            numberTwo: 00,
            result: 00,
            score: 0,
            levels: Levels.easy)) {
    on<GetNumbersEasyEvent>(_getNumbersEasy);
    on<GetNumbersMediumEvent>(_getNumbersMedium);
    on<GetNumbersHardEvent>(_getNumbersHard);
    on<NumberPressed>(_onNumberPressed);
    on<NegativeInt>(_convertToNegative);
    on<ClearNumberEvent>(_clearNumber);
    on<ClearScoreEvent>(_clearScore);
  }

  Random random = Random();
  var listOperators = ['+', '-'];
  var listOperatorsHard = ['+', '-', 'x'];

  void _getNumbersEasy(
      GetNumbersEasyEvent event, Emitter<CalculationsState> emit) {
    int numberOne = random.nextInt(100);
    int numberTwo = random.nextInt(min(numberOne, 100));
    var operator = listOperators[random.nextInt(listOperators.length)];
    int score = state.score;

    if (state.operatorOne == '+') {
      var result = state.numberOne + state.numberTwo;
      if (result == state.result) {
        score = state.score + 10;
      } else {
        if (state.score > 0) {
          score = state.score - 10;
        }
      }
    }
    if (state.operatorOne == '-') {
      var result = state.numberOne - state.numberTwo;
      if (result == state.result) {
        score = state.score + 10;
      } else {
        if (state.score > 0) {
          score = state.score - 10;
        }
      }
    }

    emit(CalculationsState(
        numberOne: numberOne,
        operatorOne: operator,
        numberTwo: numberTwo,
        result: 00,
        score: score,
        levels: Levels.easy));
  }

  void _getNumbersMedium(
      GetNumbersMediumEvent event, Emitter<CalculationsState> emit) {
    int numberOne = random.nextInt(10) + 1;
    var operatorOne = 'x';
    int numberTwo = random.nextInt(20) + 1;
    var operatorTwo = listOperators[random.nextInt(listOperators.length)];
    int numberThree = random.nextInt(100);
    var score = state.score;

    if (state.operatorTwo == '+') {
      var result = state.numberOne * state.numberTwo + state.numberThree!;
      if (result == state.result) {
        score = state.score + 30;
      } else {
        if (state.score > 0) {
          score = state.score - 30;
        }
      }
    }
    if (state.operatorTwo == '-') {
      var result = state.numberOne * state.numberTwo + state.numberThree!;
      if (result == state.result) {
        score = state.score + 30;
      } else {
        if (state.score > 0) {
          score = state.score - 30;
        }
      }
    }

    emit(CalculationsState(
        numberOne: numberOne,
        operatorOne: operatorOne,
        numberTwo: numberTwo,
        operatorTwo: operatorTwo,
        numberThree: numberThree,
        result: 0,
        score: score,
        levels: Levels.medium));
  }

  void _getNumbersHard(
      GetNumbersHardEvent event, Emitter<CalculationsState> emit) {
    int numberOne = random.nextInt(100);
    var operatorOne =
        listOperatorsHard[random.nextInt(listOperatorsHard.length)];
    int numberTwo = random.nextInt(100);
    var operatorTwo =
        listOperatorsHard[random.nextInt(listOperatorsHard.length)];
    int numberThree = random.nextInt(100);
    var score = state.score;

    if (operatorOne == 'x') {
      numberTwo = random.nextInt(10) + 1;
    }
    if (operatorTwo == 'x') {
      numberThree = random.nextInt(10) + 1;
    }
    if (operatorOne == 'x' && operatorTwo == 'x') {
      numberOne = random.nextInt(10) + 1;
      numberTwo = random.nextInt(10) + 1;
      numberThree = random.nextInt(10) + 1;
    }

    if (state.operatorOne == '-' && state.operatorTwo == '-') {
      var result = state.numberOne - state.numberTwo - state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == '+' && state.operatorTwo == '-') {
      var result = state.numberOne + state.numberTwo - state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == '+' && state.operatorTwo == '+') {
      var result = state.numberOne + state.numberTwo + state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == '-' && state.operatorTwo == '+') {
      var result = state.numberOne - state.numberTwo + state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == 'x' && state.operatorTwo == '+') {
      var result = state.numberOne * state.numberTwo + state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == '+' && state.operatorTwo == 'x') {
      var result = state.numberOne + state.numberTwo * state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == 'x' && state.operatorTwo == '-') {
      var result = state.numberOne * state.numberTwo - state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == '-' && state.operatorTwo == 'x') {
      var result = state.numberOne - state.numberTwo * state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }
    if (state.operatorOne == 'x' && state.operatorTwo == 'x') {
      var result = state.numberOne * state.numberTwo * state.numberThree!;
      if (result == state.result) {
        score = state.score + 60;
      } else {
        if (state.score > 0) {
          score = state.score - 60;
        }
      }
    }

    emit(CalculationsState(
        numberOne: numberOne,
        operatorOne: operatorOne,
        numberTwo: numberTwo,
        operatorTwo: operatorTwo,
        numberThree: numberThree,
        result: 0,
        score: score,
        levels: Levels.hard));
  }

  void _onNumberPressed(NumberPressed event, Emitter<CalculationsState> emit) {
    var number = event.number;

    if (state.result != 0) {
      number = int.parse('${state.result}${event.number}');
    }

    if (state.operatorTwo == null) {
      emit(CalculationsState(
          numberOne: state.numberOne,
          operatorOne: state.operatorOne,
          numberTwo: state.numberTwo,
          result: number,
          score: state.score,
          levels: state.levels));
    }
    emit(CalculationsState(
        numberOne: state.numberOne,
        operatorOne: state.operatorOne,
        numberTwo: state.numberTwo,
        operatorTwo: state.operatorTwo,
        numberThree: state.numberThree,
        result: number,
        score: state.score,
        levels: state.levels));
  }

  void _convertToNegative(NegativeInt event, Emitter<CalculationsState> emit) {
    if (state.operatorTwo == null) {
      emit(CalculationsState(
          numberOne: state.numberOne,
          operatorOne: state.operatorOne,
          numberTwo: state.numberTwo,
          result: -state.result.abs(),
          score: state.score,
          levels: state.levels));
    }

    emit(CalculationsState(
      numberOne: state.numberOne,
      operatorOne: state.operatorOne,
      numberTwo: state.numberTwo,
      operatorTwo: state.operatorTwo,
      numberThree: state.numberThree,
      result: -state.result.abs(),
      score: state.score,
      levels: state.levels,
    ));
  }

  void _clearNumber(ClearNumberEvent event, Emitter<CalculationsState> emit) {
    emit(CalculationsState(
        numberOne: state.numberOne,
        operatorOne: state.operatorOne,
        numberTwo: state.numberTwo,
        operatorTwo: state.operatorTwo,
        numberThree: state.numberThree,
        result: 0,
        score: state.score,
        levels: state.levels));
  }

  void _clearScore(ClearScoreEvent event, Emitter<CalculationsState> emit) {
    emit(CalculationsState(
        numberOne: state.numberOne,
        operatorOne: state.operatorOne,
        numberTwo: state.numberTwo,
        operatorTwo: state.operatorTwo,
        numberThree: state.numberThree,
        result: 0,
        score: 0,
        levels: state.levels));
  }
}
