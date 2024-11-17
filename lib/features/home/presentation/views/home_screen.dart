import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/widgets/build_home_item.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/widgets/build_plan_item.dart';
import 'package:fitness_tracker_app/features/workout_plans/presentation/views/exercise_plan_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(15.0.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout plans for you',
              style: TextStyle(
                  fontSize: 21.0.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            InkWell(
              onTap: () {
                HomeCubit.get(context).getExerciseFullBodyPlan(30);
                navigateTo(
                    context,
                    ExercisePlanDetailsScreen(
                      title: 'Full-Body HIIT Blast',
                      description:
                          'Get ready for an intense full body workout that will boost your metabolism and torch calories. This high intensity interval training (HIIT) program is designed to increase strength and endurance.',
                      numWorkouts:
                          '29',
                      numMinutes: '150',
                      numKcal: '500',
                      image: fullBodyImage,
                    ));
              },
              child: const BuildPlanItem(
                  image: fullBodyImage,
                  text1: 'Full-Body HIIT Blast',
                  text2: '150 min   ·   Intermediate'),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            InkWell(
              onTap: () {
                HomeCubit.get(context).getExerciseDailyPlan(5);
                navigateTo(
                    context,
                    ExercisePlanDetailsScreen(
                      title: 'Daily Exercise',
                      description:
                          'Power up your day with a dynamic full-body workout to build strength and stamina. This quick, intense session combines cardio and resistance moves to boost energy, burn calories, and tone muscles efficiently.',
                      numWorkouts:
                          '5',
                      numMinutes: '20',
                      numKcal: '50',
                      image: dailyImage,
                    ));
              },
              child: const BuildPlanItem(
                  image: dailyImage,
                  text1: 'Daily Exercise',
                  text2: '20 min   ·   Beginner'),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text(
              'Body Focus Area',
              style: TextStyle(
                  fontSize: 21.0.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 20.0.w, // spacing between columns
                mainAxisSpacing: 20.0.w, // spacing between rows
                childAspectRatio: 0.75, // adjust for item size ratio
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  final homeCubit = HomeCubit.get(context);

                  // Perform the async operation
                  homeCubit.getExerciseByName(
                    homeCubit.getDataTitleList[index],
                    15,
                  );
                  navigateTo(
                    context,
                    ExercisePlanDetailsScreen(
                      title: homeCubit.homeItemTitleList[index],
                      description: homeCubit.homeItemDescriptionList[index],
                      numWorkouts: '15',
                      numMinutes: '90',
                      numKcal: '230',
                      image: homeCubit.homeItemImageList[index],
                    ),
                  );
                },
                child: BuildHomeItem(
                    image: HomeCubit.get(context).homeItemImageList[index],
                    text: HomeCubit.get(context).homeItemTitleList[index]),
              ),
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}
