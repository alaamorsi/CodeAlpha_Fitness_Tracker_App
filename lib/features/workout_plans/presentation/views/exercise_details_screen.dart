import 'dart:math';
import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/widgets/build_congratulation.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/widgets/build_exercise_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final String type;
  final int workouts;
  final int minutes;
  final int kcal;

  const ExerciseDetailsScreen(
      {super.key,
      required this.type,
      required this.workouts,
      required this.minutes,
      required this.kcal});

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  late PageController pageController;
  int pageNumber = 1;
  final List<int> options = [5, 10, 15, 20];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(
                top: 50.0.h, left: 13.0.w, right: 13.0.w, bottom: 20.0.h),
            child: state is HomeGetDataLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close)),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                              child: LinearProgressIndicator(
                                value: pageNumber /
                                    (widget.type == 'Full-Body HIIT Blast'
                                        ? homeCubit
                                            .exercisesFullBodyPlanList.length
                                        : widget.type == 'Daily Exercise'
                                            ? homeCubit
                                                .exercisesDailyPlanList.length
                                            : homeCubit.exerciseList.length),
                                color: mainColor,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                                minHeight: 10.0.h,
                                borderRadius: BorderRadius.circular(12.0.sp),
                              ),
                            ),
                          ),
                          Text(
                            '$pageNumber/${widget.type == 'Full-Body HIIT Blast' ? homeCubit.exercisesFullBodyPlanList.length : widget.type == 'Daily Exercise' ? homeCubit.exercisesDailyPlanList.length : homeCubit.exerciseList.length}',
                            style: TextStyle(
                                fontSize: 18.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Expanded(
                        child: PageView.builder(
                            controller: pageController,
                            itemCount: widget.type == 'Full-Body HIIT Blast'
                                ? homeCubit.exercisesFullBodyPlanList.length
                                : widget.type == 'Daily Exercise'
                                    ? homeCubit.exercisesDailyPlanList.length
                                    : homeCubit.exerciseList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            onPageChanged: (int index) {
                              if (index <
                                  (widget.type == 'Full-Body HIIT Blast'
                                      ? homeCubit
                                          .exercisesFullBodyPlanList.length
                                      : widget.type == 'Daily Exercise'
                                          ? homeCubit
                                              .exercisesDailyPlanList.length
                                          : homeCubit.exerciseList.length)) {
                                if (index < pageNumber - 1) {
                                  setState(() {
                                    pageNumber--;
                                  });
                                } else {
                                  setState(() {
                                    pageNumber++;
                                  });
                                }
                              }
                            },
                            itemBuilder: (context, index) => widget.type ==
                                    'Full-Body HIIT Blast'
                                ? BuildExerciseDetails(
                                    image: HomeCubit.get(context)
                                        .exercisesFullBodyPlanList[index]
                                        .gifUrl,
                                    name: HomeCubit.get(context)
                                        .exercisesFullBodyPlanList[index]
                                        .name,
                                    times:
                                        'X${options[Random().nextInt(options.length)]}',
                                    instructions: HomeCubit.get(context)
                                        .exercisesFullBodyPlanList[index]
                                        .instructions[0])
                                : widget.type == 'Daily Exercise'
                                    ? BuildExerciseDetails(
                                        image: HomeCubit.get(context)
                                            .exercisesDailyPlanList[index]
                                            .gifUrl,
                                        name: HomeCubit.get(context)
                                            .exercisesDailyPlanList[index]
                                            .name,
                                        times:
                                            'X${options[Random().nextInt(options.length)]}',
                                        instructions: HomeCubit.get(context)
                                            .exercisesDailyPlanList[index]
                                            .instructions[0])
                                    : BuildExerciseDetails(
                                        image: HomeCubit.get(context)
                                            .exerciseList[index]
                                            .gifUrl,
                                        name: HomeCubit.get(context)
                                            .exerciseList[index]
                                            .name,
                                        times:
                                            'X${options[Random().nextInt(options.length)]}',
                                        instructions: HomeCubit.get(context)
                                            .exerciseList[index]
                                            .instructions[0])),
                      ),
                      Row(
                        children: [
                          if (pageNumber > 1)
                            Expanded(
                              child: BuildButton(
                                onPressed: () {
                                  pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                text: 'Previous',
                                textColor: mainColor,
                                backColor: mainColor.withOpacity(0.1), isLoading: false,
                              ),
                            ),
                          SizedBox(
                            width: 20.0.w,
                          ),
                          Expanded(
                            child: BuildButton(
                                onPressed: () async {
                                  if (widget.type == 'Full-Body HIIT Blast') {
                                    if (pageNumber <
                                        homeCubit
                                            .exercisesFullBodyPlanList.length) {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      await HomeCubit.get(context).updateReportData(widget.workouts, widget.minutes, widget.kcal);
                                      navigateAndFinish(
                                          context, const BuildCongratulation());
                                    }
                                  } else if (widget.type == 'Daily Exercise') {
                                    if (pageNumber <
                                        homeCubit
                                            .exercisesDailyPlanList.length) {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      await HomeCubit.get(context).updateReportData(widget.workouts, widget.minutes, widget.kcal);
                                      navigateAndFinish(
                                          context, const BuildCongratulation());
                                    }
                                  } else {
                                    if (pageNumber <
                                        HomeCubit.get(context)
                                            .exerciseList
                                            .length) {
                                      pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    } else {
                                      await HomeCubit.get(context)
                                          .updateReportData(widget.workouts,
                                              widget.minutes, widget.kcal);
                                        navigateAndFinish(
                                          context, const BuildCongratulation());
                                    }
                                  }
                                },
                                text: pageNumber ==
                                        (widget.type == 'Full-Body HIIT Blast'
                                            ? homeCubit
                                                .exercisesFullBodyPlanList
                                                .length
                                            : widget.type == 'Daily Exercise'
                                                ? homeCubit
                                                    .exercisesDailyPlanList
                                                    .length
                                                : homeCubit.exerciseList.length)
                                    ? 'Done'
                                    : 'Continue',
                                textColor: Colors.white,
                                backColor: mainColor, isLoading: false,),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
