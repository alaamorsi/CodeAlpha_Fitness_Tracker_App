import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPlanAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final void Function() onPressed;

  const BuildPlanAppBar({
    super.key,
    required this.image, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: 120.0.h,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back, size: 27.0.sp),
        color: Colors.white,
      ),
      flexibleSpace: Container(
        width: double.infinity,
        height: 150.0.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0.sp),
            gradient: const LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.centerLeft,
                end: Alignment.center),
          ),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120.0.h);
}
