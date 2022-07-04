class BMI {
  late final int? id;
  late final String username;
  final int height;
  final int weight;
  late final double score;
  late final String rating;
  late final String date;

  BMI({
    required this.height,
    required this.weight,
  });

  BMI.db(
      {this.id,
      required this.username,
      required this.height,
      required this.weight,
      required this.score,
      required this.rating,
      required this.date});

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

  factory BMI.fromMap(Map<String, dynamic> json) => BMI.db(
        id: json['id'],
        username: json['username'],
        height: json['height'],
        weight: json['weight'],
        score: json['score'],
        rating: json['rating'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'height': height,
      'weight': weight,
      'score': score,
      'rating': rating,
      'date': date,
    };
  }
}
