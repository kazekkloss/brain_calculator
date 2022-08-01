part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class AddPlayer extends PlayerEvent {
  final String name;
  const AddPlayer({required this.name});

  @override
  List<Object> get props => [name];
}

class RemovePlayer extends PlayerEvent {}
