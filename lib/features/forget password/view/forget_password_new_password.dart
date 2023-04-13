import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_congratulation_screen.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_otp_screen.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordNewPasswordScreen extends StatefulWidget {
  const ForgetPasswordNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordNewPasswordScreen> createState() =>
      _ForgetPasswordNewPasswordScreenState();
}

class _ForgetPasswordNewPasswordScreenState
    extends State<ForgetPasswordNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPasswordBarWidget(
              onPressed: () {
                push(context, const ForgetPasswordOTPScreen());
              },
              title: S().forgetPassword,
            ),
            SizedBox(
              height: 5.h,
            ),
            const AppSVG(assetName: 'forgetPasswordNewPassword'),
            SizedBox(
              height: 5.h,
            ),
            Text("${S().enterNewPassword}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.8.sp),
                textAlign: TextAlign.center),
            SizedBox(
              height: 2.h,
            ),
            AppTextField(
                hint: '${S().newPassword}',
                keyboardType: TextInputType.visiblePassword,
                controller: TextEditingController(),
                isPassword: true,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.visiblePassword),
            AppTextField(
                hint: '${S().confirmNewPassword}',
                keyboardType: TextInputType.visiblePassword,
                controller: TextEditingController(),
                isPassword: true,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword),
            SizedBox(
              height: 4.h,
            ),
            AppButton(
              onPressed: () {
                push(context, const ForgetPasswordCongratulationScreen());
              },
              label: '${S().confirm}',
              sizeFont: 16.sp,
              borderRadius: BorderRadius.circular(12.sp),
              bgColor: AppColors.primary,
            )
          ],
        ),
      ),
    ));
  }
}
