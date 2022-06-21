import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BMI {
  final double height;
  final double weight;
  static double? low;
  static double? high;
  static final List<String> descriptions = [
    "Underweight",
    "Healthy Weight",
    "Overweight",
    "Obese"
  ];
  const BMI ({
  required this.height,
  required this.weight
  });

  double compute() {
    return weight / (height * height) * 10000;
  }

  computeBmiResult() {
    double bmi = compute();

    String rating = bmiRating(bmi);

    Map<String, String> data = {
      "BMI": bmi.toStringAsFixed(1),
      "Rating": rating
    };
    return data;
  }

  String bmiRating(double score) {
    if (score < 18.5) {
      return "Underweight";
    } else if (score >= 18.5 && score <= 24.9) {
      return "Healthy Weight";
    } else if (score >= 25 && score <= 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  void rating(double low, double high) {
    BMI.low = low;
    BMI.high = high;
  }
}