import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildWeight extends StatefulWidget {
  const BuildWeight({super.key});

  @override
  State<BuildWeight> createState() => _BuildWeightState();
}

class _BuildWeightState extends State<BuildWeight> {
  final int minWeight = 40;
  final int maxWeight = 200;
  int selectedWeight = 70;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30.0.h,
          ),
          Text(
            'Enter Your Weight',
            style: TextStyle(
                fontSize: 28.0.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            'Your weight helps us design suitable workouts.',
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
                  const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 50,
                      endIndent: 50),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                          initialItem: selectedWeight - minWeight),
                      itemExtent: 50, // Weight of each item
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedWeight = minWeight + index;
                        });
                      },
                      children: List<Widget>.generate(
                        maxWeight - minWeight + 1,
                        (index) => Center(
                          child: Text(
                            '${minWeight + index} kg',
                            style: TextStyle(
                              fontSize: 24,
                              color: selectedWeight == minWeight + index
                                  ? mainColor
                                  : Colors.black54,
                              fontWeight:
                                  selectedWeight == minWeight + index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 50,
                      endIndent: 50),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.0.h,
          ),
        ],
      ),
    );
  }
}
