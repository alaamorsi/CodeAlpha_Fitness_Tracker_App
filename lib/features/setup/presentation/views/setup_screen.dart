import 'package:fitness_tracker_app/core/constants/colors.dart';
import 'package:fitness_tracker_app/core/shared_function/navigation.dart';
import 'package:fitness_tracker_app/core/shared_widgets/build_button.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/widgets/build_age.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/widgets/build_genders.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/widgets/build_goal.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/widgets/build_height.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/widgets/build_weight.dart';
import 'package:fitness_tracker_app/features/setup/presentation/views/finish_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  late PageController pageController;
  int pageNumber = 1;
  List<Widget> widgetsList = [const BuildGenders(), const BuildAge(), const BuildHeight(),const BuildWeight(),const BuildGoal()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(
            top: 50.0.h, left: 13.0.w, right: 13.0.w, bottom: 20.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (pageNumber > 1)
                  IconButton(
                      onPressed: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.arrow_back)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                    child: LinearProgressIndicator(
                      value: 1 / 5 * pageNumber ,
                      color: mainColor,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      minHeight: 10.0.h,
                      borderRadius: BorderRadius.circular(12.0.sp),
                    ),
                  ),
                ),
                Text(
                  '$pageNumber/5',
                  style: TextStyle(
                      fontSize: 18.0.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  if (index < 5) {
                    if (index < pageNumber - 1) {
                      setState(() {
                        pageNumber--;
                      });
                    } else {
                      setState(() {
                        pageNumber++;
                      });
                    }
                  }
                },
                itemBuilder: (context, index) => widgetsList[pageNumber - 1],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: BuildButton(
                    onPressed: () {
                      navigateAndFinish(context, const HomeMainScreen());
                    },
                    text: 'Skip',
                    textColor: mainColor,
                    backColor: mainColor.withOpacity(0.1), isLoading: false,
                  ),
                ),
                SizedBox(
                  width: 20.0.w,
                ),
                Expanded(
                  child: BuildButton(
                      onPressed: () {
                        if (pageNumber < widgetsList.length) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                        else{
                          navigateAndFinish(context, const FinishSetupScreen());
                        }
                      },
                      text: 'Continue',
                      textColor: Colors.white,
                      backColor: mainColor, isLoading: false,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
