import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishSetupScreen extends StatelessWidget {
  const FinishSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(
            top: 100.0.h, left: 13.0.w, right: 13.0.w, bottom: 20.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Workout Plan is',
              style: TextStyle(
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Text(
              'Ready!',
              style: TextStyle(
                  fontSize: 28.0.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text(
              'Your personalized workout plan has been generated successfully.',
              style: TextStyle(
                  fontSize: 16.0.sp,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10.0.h,),
            SizedBox(
              width: double.infinity,
              height: 0.5.sh,
              child: Card(
                elevation: 50.0.sp,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.sp),
                    border: Border.all(width: 1.0.w,color: mainColor),
                    image: const DecorationImage(image: AssetImage(dailyImage),fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const Spacer(),
            BuildButton(onPressed: (){
              navigateAndFinish(context, const HomeMainScreen());
            },text: 'Get Started!', textColor: Colors.white, backColor: mainColor, isLoading: false,),
          ],
        ),
      ),
    );
  }
}
