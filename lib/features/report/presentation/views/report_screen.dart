import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/report/presentation/views/widgets/build_chart_analysis.dart';
import 'package:fitness_tracker_app/features/report/presentation/views/widgets/build_report_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String selectedPeriod = "This Week";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(10.0.w),
            child: state is HomeGetReportLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                    color: mainColor,
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120.0.h,
                        padding: EdgeInsets.all(10.0.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0.sp),
                          border: Border.all(
                              width: 1.0.w, color: mainColor.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             BuildReportItem(
                                image: workoutsImage,
                                num: HomeCubit.get(context).userReport.workouts.toString(),
                                name: 'workouts'),
                            SizedBox(
                              width: 25.0.w,
                            ),
                             BuildReportItem(
                                image: minutesImage,
                                num: HomeCubit.get(context).userReport.minutes.toString(),
                                name: 'minutes'),
                            SizedBox(
                              width: 25.0.w,
                            ),
                             BuildReportItem(
                                image: kcalImage, num: HomeCubit.get(context).userReport.kcal.toString(), name: 'kcal'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Expanded(
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.all(10.0.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0.sp),
                              border: Border.all(
                                  width: 1.0.w,
                                  color: mainColor.withOpacity(0.3)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Statistics',
                                      style: TextStyle(
                                          fontSize: 21.0.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 40.0.h,
                                      padding: EdgeInsets.all(10.0.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0.sp),
                                          border: Border.all(
                                              width: 1.0.w,
                                              color:
                                                  mainColor.withOpacity(0.3))),
                                      child: PopupMenuButton<String>(
                                        position: PopupMenuPosition.under,
                                        color: Colors.white,
                                        initialValue: selectedPeriod,
                                        onSelected: (String newValue) {
                                          setState(() {
                                            selectedPeriod = newValue;
                                          });
                                        },
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          PopupMenuItem<String>(
                                            value: 'This Week',
                                            child: Text(
                                              'This Week',
                                              style: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: 'Last Week',
                                            child: Text(
                                              'Last Week',
                                              style: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: 'This Month',
                                            child: Text(
                                              'This Month',
                                              style: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: 'Last Month',
                                            child: Text(
                                              'Last Month',
                                              style: TextStyle(
                                                  fontSize: 14.0.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                        child: Row(
                                          children: [
                                            Text(
                                              selectedPeriod,
                                              style: TextStyle(
                                                fontSize: 16.0.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Icon(Icons.arrow_drop_down),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0.h,
                                ),
                                Expanded(
                                    child: CustomBarChart(
                                  type: selectedPeriod.toLowerCase(),
                                )),
                              ],
                            )),
                      ),
                    ],
                  ));
      },
    );
  }
}
