import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/score_model.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(const ScoreState()) {
    on<Test>(_onTest);
  }

  void _onTest(Test event, Emitter emit) {
    final state = this.state;
    if (state.scoreList.length < 10) {
      emit(ScoreState(scoreList: List.from(state.scoreList)..add(event.score)));
    }
  }

  @override
  ScoreState? fromJson(Map<String, dynamic> json) {
    return ScoreState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ScoreState state) {
    return state.toMap();
  }
}
