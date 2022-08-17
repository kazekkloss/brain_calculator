import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../model/score_model.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends HydratedBloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(const ScoreState()) {
    on<AddScore>(_onAdd);
    on<RemoveScore>(_remove);
  }

  void _onAdd(AddScore event, Emitter emit) {
    final state = this.state;
    if (state.scoreList.length != 10) {
      state.scoreList.add(event.score);
      state.scoreList.sort((a, b) => b.points.compareTo(a.points));
      emit(ScoreState(scoreList: state.scoreList));
    } else if (state.scoreList.last.points < event.score.points) {
      state.scoreList.remove(state.scoreList.last);
      state.scoreList.add(event.score);
      state.scoreList.sort((a, b) => b.points.compareTo(a.points));
      emit(ScoreState(scoreList: state.scoreList));
    }
  }

  //to remove
  void _remove(RemoveScore event, Emitter emit) {
    final state = this.state;
    emit(ScoreState(scoreList: state.scoreList..remove(event.score)));
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
