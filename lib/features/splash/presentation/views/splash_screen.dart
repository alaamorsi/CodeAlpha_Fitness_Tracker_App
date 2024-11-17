import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/core/constants/variables.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/start_screen.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
    ));
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onAnimationEnd();
      }
    });
  }

  void onAnimationEnd() async {
    await AuthenticationCubit.get(context).getUserData();
    if (uId != null && uId != '') {
      if (mounted) {
        navigateAndFinish(context, const HomeMainScreen());
      }
    } else {
      if (mounted) {
        navigateAndFinish(context, const StartScreen());
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [mainColor, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(splashImage),
                fit: BoxFit.cover,
                opacity: 0.2),
          ),
          child: SlideTransition(
            position: animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: 150.0.w,
                  height: 150.0.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(splashIcon), fit: BoxFit.contain)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0.sp),
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Text(
                  'BeFit',
                  style: TextStyle(
                      fontSize: 36.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 100.0.h),
                SizedBox(
                  width: 50.0.w,
                  height: 50.0.w,
                  child: const LoadingIndicator(
                    indicatorType: Indicator.ballPulse,
                    colors: [Colors.white],
                  ),
                ),
                SizedBox(height: 100.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
