import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReactWidget extends StatefulWidget {
  const ReactWidget({Key? key, required this.image, required this.number, required this.onPressed}) : super(key: key);

  final String image;
  final int number;
  final GestureTapCallback onPressed;

  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(
                width: 0.2.w,
                color: Colors.grey.shade400),
          ),
          child: Row(
            children: [
              AppSVG(assetName: widget.image, height: 13.sp,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white
    ,),
              SizedBox(width: 2.w),
              Text(
                widget.number.toString(),
                style: TextStyle(fontSize: 13.sp),
              )
            ],
          )),
    );
  }
}
