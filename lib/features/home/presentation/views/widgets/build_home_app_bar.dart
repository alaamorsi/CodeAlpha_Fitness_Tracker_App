import 'package:fitness_tracker_app/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BuildHomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(fontSize: 24.0.sp,color: Colors.black,fontWeight: FontWeight.w700),),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      elevation: 0.0,
      toolbarHeight: 70.0,
      leadingWidth: 80.0.w,
      leading: Container(
        padding: EdgeInsets.only(left: 20.0.w),
        margin: EdgeInsets.all(15.0.w),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(appBarIcon),fit: BoxFit.contain),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0.h);
}
