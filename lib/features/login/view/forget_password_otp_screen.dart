import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/login/view/forget_password_new_password.dart';
import 'package:foodtracker/features/login/view/forget_password_screen.dart';
import 'package:foodtracker/features/login/widget/forget_password_bar_widget.dart';
import 'package:foodtracker/features/login/widget/otp.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordOTPScreen extends StatefulWidget {
  const ForgetPasswordOTPScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordOTPScreen> createState() =>
      _ForgetPasswordOTPScreenState();
}

class _ForgetPasswordOTPScreenState extends State<ForgetPasswordOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPasswordBarWidget(
              onPressed: () {
                push(context, ForgetPasswordScreen());
              },
            ),
            SizedBox(
              height: 4.h,
            ),
            AppSVG(assetName: 'forgetPaswwordOTP'),
            SizedBox(
              height: 5.h,
            ),
            Text("please enter the 4 digit code that\nhave been send to email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.8.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OTPItem(first: true, last: false),
                OTPItem(first: true, last: false),
                OTPItem(first: true, last: false),
                OTPItem(first: true, last: false),

              ],
            ),
            SizedBox(height: 3.h,),

            AppButton(onPressed: () {
              push(context, ForgetPasswordNewPasswordScreen());
            }, label: 'Confirm', sizeFont: 18.sp,borderRadius: BorderRadius.circular(12.sp),bgColor: AppColors.primary,
            )
          ],
        ),
      ),
    ));
  }
}
