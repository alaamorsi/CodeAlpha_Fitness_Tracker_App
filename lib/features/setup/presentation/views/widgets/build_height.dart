import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHeight extends StatefulWidget {
  const BuildHeight({super.key});

  @override
  State<BuildHeight> createState() => _BuildHeightState();
}

class _BuildHeightState extends State<BuildHeight> {
  final int minHeight = 140;
  final int maxHeight = 220;
  int selectedHeight = 175;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30.0.h,
          ),
          Text(
            'Enter Your Height',
            style: TextStyle(
                fontSize: 28.0.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            'Your height helps us design suitable workouts.',
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
                      scrollController: FixedExtentScrollController(initialItem: selectedHeight - minHeight),
                      itemExtent: 50, // Height of each item
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedHeight = minHeight + index;
                        });
                      },
                      children: List<Widget>.generate(
                        maxHeight - minHeight + 1,
                            (index) => Center(
                          child: Text(
                            '${minHeight + index} cm',
                            style: TextStyle(
                              fontSize: 24,
                              color: selectedHeight == minHeight + index ? mainColor : Colors.black54,
                              fontWeight: selectedHeight == minHeight + index ? FontWeight.bold : FontWeight.normal,
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
