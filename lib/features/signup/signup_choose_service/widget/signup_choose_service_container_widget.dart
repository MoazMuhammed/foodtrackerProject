import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({Key? key, required this.image, required this.title}) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.container,
          ),
          child: AppSVG(assetName: image),
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
