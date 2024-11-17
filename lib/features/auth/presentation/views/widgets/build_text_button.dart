import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressedText;

  const BuildTextButton({super.key, required this.text, required this.onPressedText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressedText,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: mainColor),
          ),
        ),
      ],
    );
  }
}
