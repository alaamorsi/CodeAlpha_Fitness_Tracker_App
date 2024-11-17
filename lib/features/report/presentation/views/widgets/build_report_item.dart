import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildReportItem extends StatelessWidget {
  final String image;
  final String num;
  final String name;

  const BuildReportItem(
      {super.key, required this.image, required this.num, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 35.0.w,
          height: 35.0.w,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Text(
          num,
          style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(
          height: 8.0.h,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ],
    );
  }
}
