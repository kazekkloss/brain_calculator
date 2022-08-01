part of 'player_bloc.dart';

class PlayerState extends Equatable {
  final PlayerModel player;
  const PlayerState({required this.player});
  
  @override
  List<Object> get props => [player];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'player': player.toMap(),
    };
  }

  factory PlayerState.fromMap(Map<String, dynamic> map) {
    return PlayerState(
      player: PlayerModel.fromMap(map['player'] as Map<String,dynamic>),
    );
  }

}
