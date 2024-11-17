import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildContinueWithGoogle extends StatelessWidget {
  final void Function() onPressedGoogle;

  const BuildContinueWithGoogle({super.key, required this.onPressedGoogle});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return OutlinedButton(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            side: WidgetStatePropertyAll(
                BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.5))),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 10.0.h),
            ),
          ),
          onPressed: onPressedGoogle,
          child: state is AuthenticationLoginWithGoogleLoadingState
              ? const Center(
                child: CircularProgressIndicator(
                            color: mainColor,
                          ),
              )
              : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30.0.h,
                height: 30.0.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(googleImage)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
