part of 'bmi_cubit.dart';

abstract class BmiState {}

class BmiLoading extends BmiState {}

class BmiCalculated extends BmiState {
  final String bmiScore;

  BmiCalculated({required this.bmiScore});
}

class BmiValues extends BmiState {
  final String height;
  final String weight;

  BmiValues({required this.height, required this.weight});
}

class BmiRating extends BmiState {
  final String bmiRating;

  BmiRating({required this.bmiRating});
}