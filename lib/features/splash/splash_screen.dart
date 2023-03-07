import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/onBoard/view/on_boarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      if (MyShared.isFirstOpen()) {
        pushReplacement(context,  OnBoardingScreen());
        return;
      }

      if (MyShared.isLoggedIn()) {
        pushReplacement(context, const SplashScreen());
      } else {
        pushReplacement(context,  const SplashScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSVG(
              assetName: 'logo',
              height: 12.h,
              width: 12.w,
            ),
            SizedBox(height: 3.h,),
            Text("Food Tracker",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),)
          ],
        ),
      ),
    );
  }

  void navigate() {
    if (MyShared.isFirstOpen()) {
      // pushAndRemoveUntil(context, const OnBoardingScreen());
      return;
    }

    if (MyShared.getString(key: MySharedKeys.apiToken).isEmpty) {
      // pushAndRemoveUntil(context, const SignInScreen());
    } else {
      // pushAndRemoveUntil(context, const MainScreen());
    }
  }
}
