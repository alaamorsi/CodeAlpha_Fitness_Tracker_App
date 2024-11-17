import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/auth/presentation/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit,AuthenticationStates>(
      listener: (context,state){
        if(state is AuthenticationLogOutSuccessState)
          {
            if(context.mounted) {
              navigateAndFinish(context, const StartScreen());
            }
          }
      },
      builder: (context,state){
        AuthenticationCubit authenticationCubit = AuthenticationCubit.get(context);
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             BuildButton(
                  onPressed: (){
                    authenticationCubit.logOut();
                  },
                 isLoading: state is AuthenticationLogOutLoadingState,
                 loadingColor: mainColor,
                  text:  'Logout',
                  textColor: Colors.red,
                  backColor: mainColor.withOpacity(0.1)),
            ],
          ),
        );
      },
    );
  }
}
