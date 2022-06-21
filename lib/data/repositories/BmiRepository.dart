

import '../models/bmi_model.dart';

class BmiRepository {
  Future<Map<String, String>> getBmiResult(double weight, double height) async {
    BMI bmi = BMI(height: height, weight: weight);
    return await bmi.computeBmiResult();
  }
}