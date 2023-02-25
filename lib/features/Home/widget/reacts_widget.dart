import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReactWidget extends StatelessWidget {
  const ReactWidget({Key? key, required this.image, required this.number, required this.onPressed}) : super(key: key);

  final String image;
  final String number;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 15.sp, vertical: 6.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(
                width: 0.2.w,
                color: Colors.grey.shade400),
          ),
          child: Row(
            children: [
              AppSVG(assetName: image, height: 13.sp),
              SizedBox(width: 2.w),
              Text(
                number,
                style: TextStyle(fontSize: 13.sp),
              )
            ],
          )),
    );
  }
}
