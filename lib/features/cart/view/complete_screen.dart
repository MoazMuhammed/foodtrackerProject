import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CongratulateScreen extends StatelessWidget {
  const CongratulateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  "${S().congratulation}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "${S().congDes} ",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 17.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8.h,
                ),
                AppSVG(
                  assetName: 'cartDone',
                  height: 30.h,
                ),
                SizedBox(
                  height: 8.h,
                ),
                AppButton(
                  onPressed: () {
                    push(context, MainScreens());
                  },
                  label: '${S().goToHome}',
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
