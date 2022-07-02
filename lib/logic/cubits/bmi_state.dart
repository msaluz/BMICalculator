part of 'bmi_cubit.dart';

abstract class BmiState {}

class BmiLoading extends BmiState {}

class BmiResult extends BmiState {
  final String height;
  final String weight;
  final String bmiScore;
  final String bmiRating;

  BmiResult(this.height, this.weight, this.bmiScore, this.bmiRating);
}