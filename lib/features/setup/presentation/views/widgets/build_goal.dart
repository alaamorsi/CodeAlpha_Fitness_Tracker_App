import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildGoal extends StatefulWidget {
  const BuildGoal({super.key});

  @override
  State<BuildGoal> createState() => _BuildGoalState();
}

class _BuildGoalState extends State<BuildGoal> {
  bool is1 = false;
  bool is2 = false;
  bool is3 = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30.0.h,
          ),
          Text(
            'Set Your Workout Goal',
            style: TextStyle(
                fontSize: 28.0.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            'What\'s your primary fitness goal? We\'ll create a plan to help you achieve it.',
            style: TextStyle(
                fontSize: 16.0.sp,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 50.0.h,
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        is1 = true;
                        is2 = false;
                        is3 = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0.h,
                      padding: EdgeInsets.all(10.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0.sp),
                        border: Border.all(
                            width: 1.0.w, color: is1 ? mainColor : Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sports_gymnastics,
                            color: Colors.amber,
                            size: 30.0.sp,
                          ),
                          SizedBox(
                            width: 20.0.w,
                          ),
                          Text(
                            'Lose Weight',
                            style: TextStyle(
                                fontSize: 21.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          if (is1)
                            Icon(
                              Icons.check,
                              size: 30.0.sp,
                              color: mainColor,
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        is2 = true;
                        is1 = false;
                        is3 = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0.h,
                      padding: EdgeInsets.all(10.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0.sp),
                        border: Border.all(
                            width: 1.0.w, color: is2 ? mainColor : Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fitness_center,
                            color: Colors.redAccent,
                            size: 30.0.sp,
                          ),
                          SizedBox(
                            width: 20.0.w,
                          ),
                          Text(
                            'Build Muscle',
                            style: TextStyle(
                                fontSize: 21.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          if (is2)
                            Icon(
                              Icons.check,
                              size: 30.0.sp,
                              color: mainColor,
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        is3 = true;
                        is1 = false;
                        is2 = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0.h,
                      padding: EdgeInsets.all(10.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0.sp),
                        border: Border.all(
                            width: 1.0.w, color: is3 ? mainColor : Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_run,
                            color: Colors.green,
                            size: 30.0.sp,
                          ),
                          SizedBox(
                            width: 20.0.w,
                          ),
                          Text(
                            'Stay Fit',
                            style: TextStyle(
                                fontSize: 21.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          if (is3)
                            Icon(
                              Icons.check,
                              size: 30.0.sp,
                              color: mainColor,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.0.h,
          ),
        ],
      ),
    );
  }
}
