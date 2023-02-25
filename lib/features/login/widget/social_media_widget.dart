import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key, required this.image, required this.onPressed, required this.name,}) : super(key: key);
final String image;
  final GestureTapCallback onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    AppSVG(
                      assetName: image,
                      height: 2.h,
                    ),
                    SizedBox(width: 2.w,),
                    Text(name)
                  ],
                )),
          )
        ],
      ),
    )
    ;
  }
}
