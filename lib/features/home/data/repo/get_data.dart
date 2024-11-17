import 'package:fitness_tracker_app/core/services/dio_helper.dart';
import 'package:fitness_tracker_app/features/home/data/models/exercise_model.dart';
import 'package:flutter/foundation.dart';

class GetData {
  Future<List<ExerciseModel>> getExerciseByName(String bodyPart, int limit) async {
    try {
      final response = await DioHelper.getData(
          url: '/bodyPart/$bodyPart?limit=$limit&offset=0');

      if (response.statusCode == 200) {
        final decodedData = response.data as List;  // Use response.data directly
        return decodedData
            .map((exercise) => ExerciseModel.fromJson(exercise))
            .toList();
      } else {
        if (kDebugMode) {
          print(
              'Failed to load exercises. Status code: ${response.statusCode}');
        }
        return [];
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred while fetching exercises: $error');
      }
      rethrow;
    }
  }
  Future<List<ExerciseModel>> getExercisesPlan(int limit,int offset) async {
    try {
      final response = await DioHelper.getData(
          url: '/bodyPart/cardio?limit=$limit&offset=$offset');

      if (response.statusCode == 200) {
        final decodedData = response.data as List;  // Use response.data directly
        return decodedData
            .map((exercise) => ExerciseModel.fromJson(exercise))
            .toList();
      } else {
        if (kDebugMode) {
          print(
              'Failed to load exercises. Status code: ${response.statusCode}');
        }
        return [];
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error occurred while fetching exercises: $error');
      }
      rethrow;
    }
  }
}
