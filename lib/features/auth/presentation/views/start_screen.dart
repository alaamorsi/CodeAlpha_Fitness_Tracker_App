import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/variables.dart';
import 'package:fitness_tracker_app/core/services/cache_helper.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/login_screen.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/register_screen.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/widgets/build_continue_with_google.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(10.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0.h,
              ),
              Center(
                child: Text(
                  'Let\'s Get Started!',
                  style: TextStyle(
                      fontSize: 28.0.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Center(
                child: Text(
                  'embark on a fitness and workout adventure.',
                  style: TextStyle(
                      fontSize: 16.0.sp,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 100.0.h,
              ),
              BlocConsumer<AuthenticationCubit, AuthenticationStates>(
                listener: (context, state) {
                  if (state is AuthenticationLoginWithGoogleSuccessState) {
                    uId = state.uId;
                    CacheHelper.saveData(key: 'uId', value: state.uId);
                    AuthenticationCubit.get(context).getUserData();
                    navigateAndFinish(context, const SetupScreen());
                  }
                },
                builder: (context, state) {
                  return BuildContinueWithGoogle(onPressedGoogle: () {
                    HomeCubit.get(context).currentIndex = 0;
                    AuthenticationCubit.get(context).signInWithGoogle();
                  });
                },
              ),
              SizedBox(
                height: 30.0.h,
              ),
              BuildButton(
                text: 'Sign up',
                textColor: Colors.white,
                backColor: mainColor,
                onPressed: () {
                  navigateTo(context, RegisterScreen());
                }, isLoading: false,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              BuildButton(
                text: 'Log in',
                textColor: mainColor,
                backColor: mainColor.withOpacity(0.2),
                onPressed: () {
                  navigateTo(context, LoginScreen());
                }, isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
