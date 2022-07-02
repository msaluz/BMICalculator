import '../models/bmi_model.dart';

class BmiRepository {
  Future<String> getBmiScore(double weight, double height) async {
    BMI bmi = BMI(height: height, weight: weight);
    return bmi.compute().toString();
  }

  Future<String> getBmiRating(double weight, double height) async {
    BMI bmi = BMI(height: height, weight: weight);
    return bmi.computeBmiRating();
  }
}