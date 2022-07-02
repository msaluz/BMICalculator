class BMI {
  final int height;
  final int weight;
  static double? low;
  static double? high;
  static final List<String> descriptions = [
    "Underweight",
    "Healthy Weight",
    "Overweight",
    "Obese"
  ];

  const BMI({
    required this.height,
    required this.weight,
  });

  double compute() {
    return weight / (height * height) * 10000;
  }

  computeBmiRating() {
    double bmi = compute();
    return bmiRating(bmi);
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