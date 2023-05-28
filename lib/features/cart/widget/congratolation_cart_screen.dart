import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CongratulationCartScreen extends StatefulWidget {
  const CongratulationCartScreen({Key? key}) : super(key: key);

  @override
  State<CongratulationCartScreen> createState() => _CongratulationCartScreenState();
}

class _CongratulationCartScreenState extends State<CongratulationCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(children: [
        ForgetPasswordBarWidget(onPressed: () => pop(context), title: "Congratulations "),
        SizedBox(height: 5.h,),
        AppSVG(assetName: "cong"),
        SizedBox(height: 2.h,),
        Text("Congratulations ",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h,),

        Text("Your order has been done correctly ",style: TextStyle(fontSize: 16.sp)),
        SizedBox(height: 10.h,),

        AppButton(onPressed: () => pushAndRemoveUntil(context, MainScreens()), label: "Go To Home", sizeFont: 16.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(14.sp),)
        
      ]),
    ));
  }
}
