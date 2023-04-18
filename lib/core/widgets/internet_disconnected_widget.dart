import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_bar_home.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InternetDisconnectedWidget extends StatelessWidget {
  const InternetDisconnectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarMain(onPressed: ()=> exit(0), title: 'Connection Error',),
            SizedBox(height: 10.h,),
            AppSVG(assetName: "error"),
            SizedBox(height: 3.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_outlined,color: Colors.red,),
                SizedBox(width: 2.w,),
                Text("Warning",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,fontSize: 19.sp),),
              ],
            ),
            SizedBox(height: 2.h,),
            Text("Please Check Your Internet Connection",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,fontSize: 16.sp),),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Expanded(
                  child: AppButton(onPressed: () {
                    Phoenix.rebirth(context);
                  }, label: 'Try Again', sizeFont: 16.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(14.sp)),
                ),
                Expanded(
                  child: AppButton(onPressed:() => AppSettings.openWIFISettings(), label: 'Go To Settings', sizeFont: 16.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(14.sp)),
                )
              ],
            )
          ],
        ),
        endDrawer: DrawerWidget(name: "name"),

      ),
    );
  }
}
