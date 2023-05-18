import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/userStatus/user_status_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/onBoard/view/on_boarding_screen.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cubit = UserStatusCubit();

  double buttonOpacity = 0;

  @override
  void initState() {
    cubit.getUserStatus();
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      if (MyShared.isFirstOpen()) {
        pushReplacement(context, OnBoardingScreen());
        return;
      }

      if (MyShared.isLoggedIn()) {
        pushReplacement(context, const MainScreens());
      } else {
        pushReplacement(context, const LoginScreen());
      }
    });

    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        buttonOpacity = 1;
        setState(() {});
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        height: 40.sp,
                        width: 40.sp,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceOut,
                        child: AppSVG(
                          height: 30.h,
                          width: 20.w,
                          assetName: 'logo',
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceInOut,
                        opacity: buttonOpacity,
                        child: Text(
                          "Food Tracker",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
