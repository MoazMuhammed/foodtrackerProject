import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({Key? key, required this.image, required this.title, required this.onPressed}) : super(key: key);
  final String image;
  final String title;
  final GestureTapCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.container,
          ),
          child: GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 23.sp,vertical: 23.sp),
              child: AppSVG(assetName: image),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
        )
      ],
    );
  }
}
