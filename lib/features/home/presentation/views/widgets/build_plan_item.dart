import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPlanItem extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;

  const BuildPlanItem({super.key, required this.image, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.sp),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 150.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.sp),
          gradient: const LinearGradient(
              colors: [Colors.black87, Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.center),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1,style: TextStyle(fontSize: 21.0.sp,color: Colors.white,fontWeight: FontWeight.w500),),
              Text(text2,style: TextStyle(fontSize: 16.0.sp,color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}
