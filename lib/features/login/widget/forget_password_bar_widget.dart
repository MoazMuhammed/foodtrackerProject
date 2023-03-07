import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordBarWidget extends StatelessWidget {
  const ForgetPasswordBarWidget({Key? key, required this.onPressed}) : super(key: key);
final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return           Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: onPressed,
              child: AppSVG(assetName: 'arrow')),
          Expanded(
              child: Center(child: Text("Forget password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),)))
        ],
      ),
    );
  }
}
