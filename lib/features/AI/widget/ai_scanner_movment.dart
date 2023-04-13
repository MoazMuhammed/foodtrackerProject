import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AIScannerMovement extends StatelessWidget {
  const AIScannerMovement({Key? key, required this.image, required this.title, required this.onPressed}) : super(key: key);
final String image;
final String title;
final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 18.sp),
        height: 15.h,
        width: 30.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
                0, 3), // changes position of shadow
          ),
        ],color: Colors.white,borderRadius: BorderRadius.circular(16.sp)),
        child: Column(
          children: [
            AppSVG(assetName: image),
            SizedBox(height: 1.h,),
            Text(title,style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
