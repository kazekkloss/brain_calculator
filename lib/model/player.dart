import 'package:equatable/equatable.dart';

class PlayerModel extends Equatable {
  final String name;
  final int totalScore;
  final int times;

  const PlayerModel(
      {required this.name, required this.totalScore, required this.times});

  PlayerModel copyWith({
    String? name,
    int? totalScore,
    int? times,
  }) {
    return PlayerModel(
        name: name ?? this.name,
        totalScore: totalScore ?? this.totalScore,
        times: times ?? this.times);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'totoalScore': totalScore,
      'times': times,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
        name: map['name'] ?? '',
        totalScore: map['totalScore'] as int,
        times: map['times'] as int);
  }

  @override
  List<Object?> get props => [name, totalScore, times];
}
