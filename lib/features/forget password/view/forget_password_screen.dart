import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_otp_screen.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
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
                push(context, const LoginScreen());
              },
              title: S().forgetPassword,
            ),
            SizedBox(
              height: 12.h,
            ),
            const AppSVG(assetName: 'forgetPassword'),
            SizedBox(
              height: 2.h,
            ),
            Text(S().enterEmailToReceiveCode,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.7.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 2.h,
            ),
            AppTextField(
              hint: S().enterEmailToReceiveCode,
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(),
              isPassword: false,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 6.h,
            ),
            AppButton(
              onPressed: () {
                push(context, const ForgetPasswordOTPScreen());
              },
              label: S().sendCode,
              sizeFont: 17.sp,
              bgColor: AppColors.primary,
              borderRadius: BorderRadius.circular(12.sp),
            )
          ],
        ),
      ),
    ));
  }
}
