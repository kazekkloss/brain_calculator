import 'package:equatable/equatable.dart';

class Score extends Equatable {
  final String date;
  final String level;
  final int score;

  const Score({required this.date, required this.level, required this.score});

  Score copyWith({String? date, String? level, int? score}) {
    return Score(
        date: date ?? this.date,
        level: level ?? this.level,
        score: score ?? this.score);
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'level': level,
      'score': score,
    };
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
        date: map['date'] ?? '',
        level: map['level'] ?? '',
        score: map['score'] ?? '');
  }

  @override
  List<Object?> get props => [date, level, score];
}
