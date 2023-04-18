import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({Key? key,required this.onPressed, required this.title}) : super(key: key);

  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: onPressed,
              child: AppSVG(
                assetName: 'close',
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
