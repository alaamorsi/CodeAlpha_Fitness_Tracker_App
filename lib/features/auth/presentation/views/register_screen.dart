import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/variables.dart';
import 'package:fitness_tracker_app/core/services/cache_helper.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/login_screen.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/start_screen.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/widgets/build_auth_app_bar.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/widgets/build_continue_with_google.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/widgets/build_text_button.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/widgets/build_text_form_field.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {
          if (state is AuthenticationCreateUserSuccessState) {
            FirebaseAuth.instance.currentUser!.sendEmailVerification();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sign up successfully,\nCheck box!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            navigateAndFinish(context, LoginScreen());
            return;
          }
          else if (state is AuthenticationLoginWithGoogleSuccessState) {
            uId = state.uId;
            CacheHelper.saveData(key: 'uId', value: state.uId);
            AuthenticationCubit.get(context).getUserData();
            navigateAndFinish(context, const SetupScreen());
          }
        },
        builder: (context, state) {
          AuthenticationCubit authenticationCubit =
              AuthenticationCubit.get(context);
          return Scaffold(
            appBar: BuildAuthAppBar(onPressedBackArrow: () {
              navigateAndFinish(context, const StartScreen());
            }),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(10.0.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Create Your Account',
                            style: TextStyle(
                                fontSize: 28.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Icon(
                            Icons.person_outline,
                            color: mainColor,
                            size: 35.0.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Text(
                        'Sign up now to get access to personalized workouts and achieve your fitness goals.',
                        style: TextStyle(
                            fontSize: 16.0.sp,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 21.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      BuildTextFormField(
                        controller: emailController,
                        hintText: 'Email',
                        isPassword: false,
                        prefixIcon: Icons.email_outlined,
                        suffixOnPressed: () {},
                        suffixIcon: null,
                        onValidate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Can\'t be empty !';
                          }
                          if (!value.contains('@') &&
                              !value.contains('.') &&
                              value.length < 10) {
                            return 'Invalid email !';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.0.h),
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 21.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      BuildTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          isPassword: true,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: Icons.visibility_off_outlined,
                          onValidate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Can\'t be empty !';
                            }
                            if (!value.contains(RegExp(r'^.{6,}$'))) {
                              return 'Must contain at least 6 characters !';
                            }
                            return null;
                          },
                          suffixOnPressed: () {}),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          BuildTextButton(
                            text: 'Log in',
                            onPressedText: () {
                              navigateTo(context, LoginScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Text(
                            'or',
                            style: TextStyle(
                                fontSize: 21.0.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      BuildContinueWithGoogle(onPressedGoogle: () {
                        HomeCubit.get(context).currentIndex = 0;
                        AuthenticationCubit.get(context).signInWithGoogle();
                      }),
                      SizedBox(
                        height: 100.0.h,
                      ),
                      BuildButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              authenticationCubit.userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: emailController.text.split('@')[0]);
                            }
                          },
                          isLoading:
                              state is AuthenticationRegisterLoadingState,
                          loadingColor: Colors.white,
                          text: 'Sign up',
                          textColor: Colors.white,
                          backColor: mainColor),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
