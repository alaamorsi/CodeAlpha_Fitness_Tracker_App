import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/core/constants/variables.dart';
import 'package:fitness_tracker_app/features/home/data/models/exercise_model.dart';
import 'package:fitness_tracker_app/features/home/data/repo/get_data.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_screen.dart';
import 'package:fitness_tracker_app/features/report/data/models/report_model.dart';
import 'package:fitness_tracker_app/features/report/presentation/views/report_screen.dart';
import 'package:fitness_tracker_app/features/settings/presentation/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> homeItemImageList = [
    chestImage,
    shouldersImage,
    armsImage,
    backImage,
    stomachImage,
    legsImage
  ];
  List<String> homeItemTitleList = [
    'Chest',
    'Shoulders',
    'Arms',
    'Back',
    'Stomach',
    'Legs'
  ];
  List<String> homeItemDescriptionList = [
    'Strengthen and tone your chest muscles with targeted exercises.',
    'Build powerful shoulders with these focused workouts.',
    'Sculpt and define your arms with these effective moves.',
    'Strengthen your back and improve posture with this routine.',
    'Flatten and tone your stomach with core-focused exercises.',
    'Boost leg strength and stability with these dynamic moves.'
  ];

  List<String> getDataTitleList = [
    'chest',
    'shoulders',
    'upper arms',
    'back',
    'waist',
    'upper legs'
  ];

  int currentIndex = 0;
  List<Widget> screensList = [
    const HomeScreen(),
    const ReportScreen(),
    const SettingsScreen(),
  ];
  List<String> titlesList = [
    'BeFit',
    'Report',
    'Settings',
  ];

  void changeBottomNav(int index, context) async {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

///////////////////////////////////////////////////////////////////////
  GetData getData = GetData();

  // Get exercise by name
  List<ExerciseModel> exerciseList = [];

  Future<void> getExerciseByName(String bodyPart, int limit) async {
    exerciseList.clear();
    emit(HomeGetDataLoadingState());
    await getData.getExerciseByName(bodyPart, limit).then((value) {
      exerciseList = value;
      emit(HomeGetDataSuccessState());
    }).catchError((error) {
      emit(HomeGetDataErrorState());
    });
  }

  // Get Exercises FullBody plan
  List<ExerciseModel> exercisesFullBodyPlanList = [];

  Future<void> getExerciseFullBodyPlan(int limit) async {
    exercisesFullBodyPlanList.clear();
    emit(HomeGetDataLoadingState());
    getData.getExercisesPlan(limit, 0).then((value) {
      exercisesFullBodyPlanList = value;
      emit(HomeGetDataSuccessState());
    }).catchError((error) {
      emit(HomeGetDataErrorState());
    });
  }

  // Get Exercises Daily plan
  List<ExerciseModel> exercisesDailyPlanList = [];

  Future<void> getExerciseDailyPlan(int limit) async {
    exercisesDailyPlanList.clear();
    emit(HomeGetDataLoadingState());
    getData.getExercisesPlan(limit, 10).then((value) {
      exercisesDailyPlanList = value;
      emit(HomeGetDataSuccessState());
    }).catchError((error) {
      emit(HomeGetDataErrorState());
    });
  }

  // update report data
  Future<void> updateReportData(int workouts, int minutes, int kcal) async {
    emit(HomeUpdateReportLoadingState());
    try {
      DocumentReference reportRef =
          FirebaseFirestore.instance.collection('reports').doc(uId);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(reportRef);

        if (snapshot.exists) {
          int currentWorkouts = snapshot.get('workouts') ?? 0;
          int currentMinutes = snapshot.get('minutes') ?? 0;
          int currentKcal = snapshot.get('kcal') ?? 0;

          transaction.update(reportRef, {
            'workouts': currentWorkouts + workouts,
            'minutes': currentMinutes + minutes,
            'kcal': currentKcal + kcal,
          });
        } else {
          transaction.set(reportRef, {
            'workouts': workouts,
            'minutes': minutes,
            'kcal': kcal,
          });
        }
      });

      emit(HomeUpdateReportSuccessState());
    } catch (error) {
      emit(HomeUpdateReportErrorState());
    }
  }

  //Get report data
  late ReportModel userReport;

  Future<void> getReportData() async {
    emit(HomeGetReportLoadingState());
    try {
      DocumentReference reportRef =
          FirebaseFirestore.instance.collection('reports').doc(uId);

      DocumentSnapshot snapshot = await reportRef.get();

      if (snapshot.exists) {
        userReport = ReportModel(
          workouts: snapshot.get('workouts') ?? 0,
          minutes: snapshot.get('minutes') ?? 0,
          kcal: snapshot.get('kcal') ?? 0,
        );
        emit(HomeGetReportSuccessState());
      } else {
        print('document doesn\'t exist');
        emit(HomeGetReportErrorState());
      }
    } catch (error) {
      print('Error retrieving report data: $error');
      emit(HomeGetReportErrorState());
    }
  }
}
