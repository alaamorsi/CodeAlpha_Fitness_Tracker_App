import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar:  BuildHomeAppBar(
            title: HomeCubit.get(context).titlesList[HomeCubit.get(context).currentIndex],
          ),
          body: HomeCubit.get(context).screensList[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: GNav(
            selectedIndex: HomeCubit.get(context).currentIndex,
              backgroundColor: Colors.white,
              rippleColor: Colors.white,
              hoverColor: mainColor,
              haptic: true,
              tabBorderRadius: 12.sp,
              gap: 8.w,
              color: Colors.grey.shade500,
              activeColor: mainColor,
              iconSize: 30.sp,
              onTabChange: (int index){
                HomeCubit.get(context).changeBottomNav(index, context);
              },
              tabs: [
                GButton(
                  icon: Icons.home_sharp,
                  text: 'Home',
                  textStyle: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w500,
                      color: mainColor),
                ),
                GButton(
                  icon: Icons.analytics_sharp,
                  text: 'Report',
                  textStyle: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w500,
                      color: mainColor),
                ),
                GButton(
                  icon: Icons.settings_sharp,
                  text: 'Settings',
                  textStyle: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w500,
                      color: mainColor),
                ),
              ]),
        );
      },
    );
  }
}
