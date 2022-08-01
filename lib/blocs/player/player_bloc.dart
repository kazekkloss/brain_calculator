import 'package:calculator/model/player.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends HydratedBloc<PlayerEvent, PlayerState> {
  PlayerBloc()
      : super(const PlayerState(
            player: PlayerModel(name: '', totalScore: 0, times: 0))) {
    on<AddPlayer>(_addPlayerToState);
  }

  void _addPlayerToState(AddPlayer event, Emitter<PlayerState> emit) {
    final PlayerModel player = state.player.copyWith(name: event.name);
    emit(PlayerState(player: player));
  }

  @override
  PlayerState? fromJson(Map<String, dynamic> json) {
    return PlayerState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(PlayerState state) {
    return state.toMap();
  }
}
