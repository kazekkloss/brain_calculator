part of 'calc_bloc.dart';

abstract class CalculationsEvent extends Equatable {
  const CalculationsEvent();

  @override
  List<Object> get props => [];
}

class GetNumbersEasyEvent extends CalculationsEvent {}

class GetNumbersMediumEvent extends CalculationsEvent {}

class GetNumbersHardEvent extends CalculationsEvent {}

class NumberPressed extends CalculationsEvent {
  final int number;

  const NumberPressed({required this.number});

  @override
  List<Object> get props => [number];
}

class NegativeInt extends CalculationsEvent {}

class ClearNumberEvent extends CalculationsEvent {}
