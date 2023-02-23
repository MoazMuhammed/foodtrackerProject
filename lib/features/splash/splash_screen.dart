import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
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
        pushReplacement(context, const MainScreen());
      } else {
        pushReplacement(context, const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppSVG(
            assetName: 'logo',
            height: 50.h,
            width: 100.w,
          ),
        ],
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
