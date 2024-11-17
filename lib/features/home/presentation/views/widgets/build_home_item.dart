import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHomeItem extends StatelessWidget {
  final String image;
  final String text;

  const BuildHomeItem({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw - 20.0.w,
      height: 120.0.h,
      padding: EdgeInsets.only(left: 20.0.w, bottom: 10.0.w),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.sp),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 21.0.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}
