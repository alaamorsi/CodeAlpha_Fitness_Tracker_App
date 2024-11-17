class ExerciseModel {
  late String bodyPart;
  late String equipment;
  late String gifUrl;
  late String id;
  late String name;
  late String target;
  late List<String> secondaryMuscles;
  late List<String> instructions;

  ExerciseModel({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
    required this.secondaryMuscles,
    required this.instructions,
  });

  // Named constructor to create an ExerciseModel from JSON
  ExerciseModel.fromJson(Map<String, dynamic> json) {
    bodyPart = json['bodyPart'];
    equipment = json['equipment'];
    gifUrl = json['gifUrl'];
    id = json['id'];
    name = json['name'];
    target = json['target'];
    secondaryMuscles = List<String>.from(json['secondaryMuscles']);
    instructions = List<String>.from(json['instructions']);
  }

  // Method to convert ExerciseModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'name': name,
      'target': target,
      'secondaryMuscles': secondaryMuscles,
      'instructions': instructions,
    };
  }
}
