import 'package:equatable/equatable.dart';

class Score extends Equatable {
  final String date;
  final String level;
  final int points;
  final String id;

  const Score({
    required this.id,
    required this.date, 
    required this.level, 
    required this.points});

  Score copyWith({
    String? id,
    String? date,
    String? level,
    int? points,
  }) {
    return Score(
      id: id ?? this.id,
      date: date ?? this.date,
      level: level ?? this.level,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'level': level,
      'points': points,
    };
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      id: map['id'] ?? '',
        date: map['date'] ?? '',
        level: map['level'] ?? '',
        points: map['points'] ?? '');
  }

  @override
  List<Object?> get props => [date, level, points, id];
}
