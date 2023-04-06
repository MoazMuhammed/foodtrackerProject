import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordBarWidget extends StatelessWidget {
  const ForgetPasswordBarWidget(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: onPressed,
              child: AppSVG(
                assetName: 'arrow',
                height: 2.5.h,
              )),
          Expanded(
              child: Center(
                  child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          )))
        ],
      ),
    );
  }
}
