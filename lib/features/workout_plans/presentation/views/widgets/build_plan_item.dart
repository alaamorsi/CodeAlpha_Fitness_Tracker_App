import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPlanItem extends StatelessWidget {
  final String image;
  final String num;
  final String name;
  const BuildPlanItem({super.key, required this.image, required this.num, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.w,
      height: 100.0.h,
      padding: EdgeInsets.all(5.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.sp),
        border: Border.all(width: 1.0.w,color: mainColor.withOpacity(0.3),),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.0.w,
            height: 40.0.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 2.0.h,),
          Text(num,style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.w500,color: Colors.black),),
          SizedBox(height: 2.0.h,),
          Text(name,style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.w500,color: Colors.black),),
        ],
      ),
    );
  }
}
