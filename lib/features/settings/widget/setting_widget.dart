import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({Key? key, required this.image, required this.title, required this.onPressed}) : super(key: key);
final String image;
final String title;
final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black)),),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.sp,vertical: 19.sp),
        child: GestureDetector(
          onTap: onPressed,
          child: Row(
            children: [
              AppSVG(assetName: image,height: 3.h),
              SizedBox(width: 4.w,),
              Text(title,style: TextStyle(fontSize: 16.sp)),
              Spacer(),
              AppSVG(assetName: 'newArrow')
            ],
          ),
        ),
      ),
    );
  }
}
