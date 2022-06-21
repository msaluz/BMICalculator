part of 'bmi_bloc.dart';

@immutable
abstract class BmiEvent {
  const BmiEvent();
}

class BmiCalculate extends BmiEvent {
  final double height;
  final double weight;

  const BmiCalculate(this.height, this.weight);
}
