import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordCongratulationScreen extends StatefulWidget {
  const ForgetPasswordCongratulationScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordCongratulationScreen> createState() =>
      _ForgetPasswordCongratulationScreenState();
}

class _ForgetPasswordCongratulationScreenState
    extends State<ForgetPasswordCongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ForgetPasswordBarWidget(
            onPressed: () {}, title: '${S().forgetPassword}',
          ),
          SizedBox(
            height: 7.h,
          ),
          const AppSVG(assetName: 'congratulation'),
          SizedBox(
            height: 5.h,
          ),
          Text("${S().congratulation}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              textAlign: TextAlign.center),
          SizedBox(
            height: 1.5.h,
          ),

          Text("${S().passwordSaved}",
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.sp),
              textAlign: TextAlign.center),


          SizedBox(
            height: 7.h,
          ),
          AppButton(
            onPressed: () {
              push(context, const MainScreens());
            },
            label: '${S().goToHome}',
            sizeFont: 16.sp,
            borderRadius: BorderRadius.circular(12.sp),
            bgColor: AppColors.primary,
          )
        ],
      ),
    ));
  }
}
