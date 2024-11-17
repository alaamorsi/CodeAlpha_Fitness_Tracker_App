import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_tracker_app/core/constants/variables.dart';
import 'package:fitness_tracker_app/core/services/bloc_observer.dart';
import 'package:fitness_tracker_app/core/services/cache_helper.dart';
import 'package:fitness_tracker_app/core/services/dio_helper.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/cubit.dart';
import 'package:fitness_tracker_app/features/home/presentation/view_models/states.dart';
import 'package:fitness_tracker_app/features/home/presentation/views/home_main_screen.dart';
import 'package:fitness_tracker_app/features/splash/presentation/views/splash_screen.dart';
import 'package:fitness_tracker_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>HomeCubit()..getReportData()),
            BlocProvider(create: (context)=>AuthenticationCubit()),
          ],
          child: BlocConsumer<HomeCubit,HomeStates>(
            listener: (context,state){},
            builder: (context,state){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'OutFit',
                ),
                home: child,
              );
            },
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
