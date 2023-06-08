import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReactWidget extends StatefulWidget {
  const ReactWidget({Key? key, required this.image, required this.number, required this.onPressed,  this.color}) : super(key: key);

  final String image;
  final String number;
  final Color? color;
  final GestureTapCallback onPressed;

  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: widget.onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSVG(assetName: widget.image, height: 18.sp,color: widget.color,),
          SizedBox(width: 2.w),
          Text(
            widget.number.toString(),
            style: TextStyle(fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
