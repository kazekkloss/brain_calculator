part of 'score_bloc.dart';

class ScoreState extends Equatable {
  final List<Score> scoreList;
  const ScoreState({this.scoreList = const <Score>[],});
  
  @override
  List<Object> get props => [scoreList];

    Map<String, dynamic> toMap() {
    return {
      'scoreList': scoreList.map((e) => e.toMap()).toList()
    };
  }

  factory ScoreState.fromMap(Map<String, dynamic> map) {
    return ScoreState(
      scoreList: List<Score>.from(map['scoreList']?.map((e) => Score.fromMap(e)))
    );
  }
}
