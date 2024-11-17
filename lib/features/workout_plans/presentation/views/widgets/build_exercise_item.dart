import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildExerciseItem extends StatelessWidget {
  final String image;
  final String name;
  final String times;

  const BuildExerciseItem(
      {super.key,
      required this.image,
      required this.name,
      required this.times});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              3,
              (i) => Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  2,
                  (j) => const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.circle,
                      size: 8.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.0.w,
        ),
        Container(
          width: 70.0.w,
          height: 70.0.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: 20.0.w,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Text(
                times,
                style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
