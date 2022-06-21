part of 'bmi_bloc.dart';

@immutable
class BmiState {
  final String bmi;
  final String bmiResult;

  const BmiState({
    required this.bmi,
    required this.bmiResult,
  });
}