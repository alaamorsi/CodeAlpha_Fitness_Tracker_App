import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildExerciseDetails extends StatelessWidget {
  final String image;
  final String name;
  final String times;
  final String instructions;
  const BuildExerciseDetails({super.key, required this.image, required this.name, required this.times, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(15.0.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 0.5.sh,
              padding: EdgeInsets.all(10.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0.sp),
                image:  DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10.0.h,),
            Text(name,style: TextStyle(fontSize: 21.0.sp,fontWeight: FontWeight.w500,color: Colors.black),),
            Text(times,style: TextStyle(fontSize: 24.0.sp,fontWeight: FontWeight.w700,color: Colors.black),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded,color: Colors.black.withOpacity(0.5),),
                SizedBox(width: 5.0.w,),
                Expanded(child: Text(instructions,style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.5)),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
