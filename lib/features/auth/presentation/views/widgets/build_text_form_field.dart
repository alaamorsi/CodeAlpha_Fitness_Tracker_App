import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final IconData prefixIcon;
  final String? Function(String?) onValidate;
  final IconData? suffixIcon;
  final void Function() suffixOnPressed;

  BuildTextFormField(
      {super.key,
      required this.hintText,
      required this.isPassword,
      required this.prefixIcon,
      required this.onValidate,
      required this.suffixOnPressed, required this.suffixIcon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
          fontSize: 21.0.sp, color: Colors.black, fontWeight: FontWeight.w400),
      cursorColor: mainColor,
      validator: (String? value) {
        return;
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 21.0.sp,
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w400),
        filled: true,
        focusColor: mainColor.withOpacity(0.1),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: suffixOnPressed,
                icon: isPassword ? Icon(suffixIcon,size: 27, color: Colors.black) : const Icon(null),
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(width: 1.0.w, color: mainColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(width: 1.0.w, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(width: 1.0.w, color: mainColor)),
      ),
    );
  }
}
