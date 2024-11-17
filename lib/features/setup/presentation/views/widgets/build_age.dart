import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAge extends StatefulWidget {
  const BuildAge({super.key});

  @override
  State<BuildAge> createState() => _BuildAgeState();
}

class _BuildAgeState extends State<BuildAge> {
  final int minAge = 15;
  final int maxAge = 80;
  int selectedAge = 22;


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          SizedBox(
            height: 30.0.h,
          ),
          Text(
            'Enter Your Age',
            style: TextStyle(
                fontSize: 28.0.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            'Your age helps us design suitable workouts.',
            style: TextStyle(
                fontSize: 16.0.sp,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 50.0.h,
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  const Divider(thickness: 1, color: Colors.grey, indent: 50, endIndent: 50),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(initialItem: selectedAge - minAge),
                      itemExtent: 50, // Height of each item
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedAge = minAge + index;
                        });
                      },
                      children: List<Widget>.generate(
                        maxAge - minAge + 1,
                            (index) => Center(
                          child: Text(
                            '${minAge + index} years',
                            style: TextStyle(
                              fontSize: 24,
                              color: selectedAge == minAge + index ? mainColor : Colors.black54,
                              fontWeight: selectedAge == minAge + index ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(thickness: 1, color: Colors.grey, indent: 50, endIndent: 50),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.0.h,),
        ],
      ),
    );
  }
}
