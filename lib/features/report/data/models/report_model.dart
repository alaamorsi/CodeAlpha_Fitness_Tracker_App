class ReportModel {
  late int workouts;
  late int minutes;
  late int kcal;

  ReportModel({
    required this.workouts,
    required this.minutes,
    required this.kcal,
  });

  // Named constructor to create an ReportModel from JSON
  ReportModel.fromJson(Map<String, dynamic> json) {
    workouts = json['workouts'];
    minutes = json['minutes'];
    kcal = json['kcal'];
  }

  // Method to convert ReportModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'workouts': workouts,
      'minutes': minutes,
      'kcal': kcal,
    };
  }
}
