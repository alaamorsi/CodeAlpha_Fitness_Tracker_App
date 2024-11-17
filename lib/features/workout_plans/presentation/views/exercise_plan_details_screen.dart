import 'dart:math';
import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/exercise_details_screen.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/widgets/build_exercise_item.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/widgets/build_plan_app_bar.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/widgets/build_plan_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExercisePlanDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String numWorkouts;
  final String numMinutes;
  final String numKcal;
  final String image;
  final List<int> options = [5, 10, 15, 20];

  ExercisePlanDetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.numWorkouts,
      required this.numMinutes,
      required this.numKcal,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: BuildPlanAppBar(
              onPressed: () {
                navigateAndFinish(context, const HomeMainScreen());
              },
              image: image),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(15.0.w),
            child: state is HomeGetDataLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 21.0.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 16.0.sp,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildPlanItem(
                                image: workoutsBImage,
                                num: numWorkouts,
                                name: 'workouts'),
                            SizedBox(
                              width: 10.0.w,
                            ),
                            BuildPlanItem(
                                image: minutesBImage,
                                num: numMinutes,
                                name: 'minutes'),
                            SizedBox(
                              width: 10.0.w,
                            ),
                            BuildPlanItem(
                                image: kcalBImage, num: numKcal, name: 'kcal'),
                          ],
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => title ==
                                  'Daily Exercise'
                              ? BuildExerciseItem(
                                  image: HomeCubit.get(context)
                                      .exercisesDailyPlanList[index]
                                      .gifUrl,
                                  name: HomeCubit.get(context)
                                      .exercisesDailyPlanList[index]
                                      .name,
                                  times:
                                      'X${options[Random().nextInt(options.length)]}')
                              : title == 'Full-Body HIIT Blast'
                                  ? BuildExerciseItem(
                                      image: HomeCubit.get(context)
                                          .exercisesFullBodyPlanList[index]
                                          .gifUrl,
                                      name: HomeCubit.get(context)
                                          .exercisesFullBodyPlanList[index]
                                          .name,
                                      times:
                                          'X${options[Random().nextInt(options.length)]}')
                                  : BuildExerciseItem(
                                      image: HomeCubit.get(context)
                                          .exerciseList[index]
                                          .gifUrl,
                                      name: HomeCubit.get(context)
                                          .exerciseList[index]
                                          .name,
                                      times:
                                          'X${options[Random().nextInt(options.length)]}'),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20.0.h,
                          ),
                          itemCount: title == 'Daily Exercise'
                              ? HomeCubit.get(context)
                                  .exercisesDailyPlanList
                                  .length
                              : title == 'Full-Body HIIT Blast'
                                  ? HomeCubit.get(context)
                                      .exercisesFullBodyPlanList
                                      .length
                                  : HomeCubit.get(context).exerciseList.length,
                        ),
                      ],
                    ),
                  ),
          ),
          floatingActionButton: Container(
            width: double.infinity,
            height: 60.0.h,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.0.w, horizontal: 20.0.w),
            child: BuildButton(
                onPressed: () {
                  navigateTo(
                      context,
                      ExerciseDetailsScreen(
                        type: title,
                        workouts: int.parse(numWorkouts),
                        minutes: int.parse(numMinutes),
                        kcal: int.parse(numKcal),
                      ));
                },
                text: 'Start',
                textColor: Colors.white,
                backColor: mainColor, isLoading: false,),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
