import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCongratulation extends StatelessWidget {
  const BuildCongratulation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(15.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 1.sh / 3 * 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(wellDoneImage), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20.0.h,),
                Center(child: Text('Well Done !',style: TextStyle(fontSize: 32.0.sp,color: Colors.green,fontWeight: FontWeight.w700),)),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: BuildButton(
                            onPressed: () {
                              navigateAndFinish(context, const HomeMainScreen());
                            },
                            text: 'Go To Home',
                            textColor: mainColor,
                            backColor: mainColor.withOpacity(0.1), isLoading: false,)),
                    SizedBox(
                      width: 10.0.w,
                    ),
                    Expanded(
                        child: BuildButton(
                            onPressed: () {
                              HomeCubit.get(context).currentIndex = 1;
                              HomeCubit.get(context).getReportData();
                              navigateAndFinish(context, const HomeMainScreen());
                            },
                            text: 'View Report',
                            textColor: Colors.white,
                            backColor: mainColor, isLoading: false,)),
                  ],
                ),
                SizedBox(
                  height: 20.0.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
