part of 'score_bloc.dart';

abstract class ScoreEvent extends Equatable {
  const ScoreEvent();

  @override
  List<Object> get props => [];
}

class AddScore extends ScoreEvent {
  final Score score;
  const AddScore({required this.score});

  @override
  List<Object> get props => [score];
}