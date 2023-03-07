import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/app_text_faild.dart';
import 'package:foodtracker/features/login/view/forget_password_otp_screen.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/login/widget/forget_password_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ForgetPasswordBarWidget(
              onPressed: () {
                push(context, LoginScreen());
              },
            ),
            SizedBox(
              height: 8.h,
            ),
            AppSVG(assetName: 'forgetPassword'),
            SizedBox(
              height: 5.h,
            ),
            Text("Please Enter Your Email\nTo Receive The code",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.8.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 2.h,
            ),
            AppTextField(
              hint: "Enter Your Email ",
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(),
              isPassword: false,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 7.h,
            ),
            AppButton(
              onPressed: () {
                push(context, ForgetPasswordOTPScreen());
              },
              label: "Send code",
              sizeFont: 18.sp,
              bgColor: AppColors.primary,
              borderRadius: BorderRadius.circular(12.sp),
            )
          ],
        ),
      ),
    ));
  }
}
