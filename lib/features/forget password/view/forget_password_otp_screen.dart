import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_new_password.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_screen.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/forget%20password/widget/otp.dart';
import 'package:foodtracker/generated/l10n.dart';
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
                push(context, const ForgetPasswordScreen());
              }, title: S().forgetPassword,
            ),
            SizedBox(
              height: 8.h,
            ),
            const AppSVG(assetName: 'forgetPasswordOTP'),
            SizedBox(
              height: 4.h,
            ),
            Text(S().otp,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.8.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                OTPItem(first: true, last: false),
                OTPItem(first: true, last: false),
                OTPItem(first: true, last: false),
                OTPItem(first: true, last: false),

              ],
            ),
            SizedBox(height: 4.h,),

            AppButton(onPressed: () {
              push(context, const ForgetPasswordNewPasswordScreen());
            }, label: S().confirm, sizeFont: 18.sp,borderRadius: BorderRadius.circular(12.sp),bgColor: AppColors.primary,
            )
          ],
        ),
      ),
    ));
  }
}
