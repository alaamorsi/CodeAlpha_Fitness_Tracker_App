import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onPressedBackArrow;

  const BuildAuthAppBar({super.key, required this.onPressedBackArrow});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      elevation: 0.0,
      leading: IconButton(
        onPressed: onPressedBackArrow,
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40.0.h);
}
