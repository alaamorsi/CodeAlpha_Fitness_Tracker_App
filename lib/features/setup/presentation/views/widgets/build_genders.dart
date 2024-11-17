import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:fitness_tracker_app/features/setup/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/setup/presentation/view_models/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildGenders extends StatelessWidget {
  const BuildGenders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SetupCubit(),
      child: BlocConsumer<SetupCubit,SetupStates>(
        listener: (context,state){},
        builder: (context,state){
          SetupCubit genderCubit = SetupCubit.get(context);
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0.h,
                ),
                Text(
                  'Select Your Gender',
                  style: TextStyle(
                      fontSize: 28.0.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  'Help us understand you better.',
                  style: TextStyle(
                      fontSize: 16.0.sp,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          genderCubit.selectGender('man');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: 0.5.sw,
                                    height: 50.0.h,
                                    color: genderCubit.isMan ? mainColor : Colors.grey,
                                  ),
                                ),
                                Container(
                                  width: 0.5.sw,
                                  height: 0.4.sh,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(manImage), fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Text(
                              'Man',
                              style: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          genderCubit.selectGender('woman');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: 0.5.sw,
                                    height: 50.0.h,
                                    color: genderCubit.isMan ? Colors.grey : mainColor
                                  ),
                                ),
                                Container(
                                  width: 0.5.sw,
                                  height: 0.4.sh,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(womanImage), fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Text(
                              'Woman',
                              style: TextStyle(
                                  fontSize: 24.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
