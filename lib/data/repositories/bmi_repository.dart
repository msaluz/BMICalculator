import '../models/bmi_model.dart';

class BmiRepository {
  Future<String> getBmiScore(int weight, int height) async {
    BMI bmi = BMI(height: height, weight: weight);
    return bmi.compute().toStringAsFixed(2);
  }

  Future<String> getBmiRating(int weight, int height) async {
    BMI bmi = BMI(height: height, weight: weight);
    return bmi.computeBmiRating();
  }

  Future<List<String>> getBmiDescription() async {
    return BMI.descriptions;
  }

}