import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseProcessWidget extends StatelessWidget {
  const ChooseProcessWidget({Key? key, required this.image, required this.title, required this.onPressed}) : super(key: key);
final String image;
final String title;
final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return
        GestureDetector(
          onTap: onPressed,
          child: Container(padding: EdgeInsets.symmetric(vertical: 29.sp,horizontal: 22.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: AppColors.container,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSVG(assetName: image),
                SizedBox(height: 3.h,),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,color: Colors.white),
                )

              ],
            ),
    ),
        );
  }
}
