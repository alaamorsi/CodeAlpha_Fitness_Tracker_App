import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backColor;
  final bool isLoading;
  final Color? loadingColor;
  final void Function()? onPressed;

      const BuildButton(
      {super.key,
       required this.isLoading,
      this.loadingColor,
      required this.text,
      required this.textColor,
      required this.backColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: const WidgetStatePropertyAll(BorderSide.none),
        backgroundColor: WidgetStatePropertyAll(backColor),
        fixedSize: WidgetStatePropertyAll(
          Size(1.0.sw, 45.0.h),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? CircularProgressIndicator(
              color: loadingColor,
            )
          : Text(
              text,
              style: TextStyle(
                  fontSize: 18.0.sp,
                  color: textColor,
                  fontWeight: FontWeight.w500),
            ),
    );
  }
}
