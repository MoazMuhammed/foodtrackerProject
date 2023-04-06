import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseProcessWidget extends StatelessWidget {
  const ChooseProcessWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.onPressed, this.description,
        })
      : super(key: key);
  final String image;
  final String title;
  final String? description;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 59.sp,
        decoration: BoxDecoration(color: AppColors.aiContainer,borderRadius: BorderRadius.circular(12.sp)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.sp),
          child: Row(
            children: [
              AppSVG(assetName: image),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 20.sp),
                child: Container(
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.white,))),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 22.sp,horizontal: 5.sp),
                  child: Column(

                    children: [
                      Text(title,style: TextStyle(color: Colors.white,fontSize: 20.sp,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),maxLines: 3),
                      SizedBox(height: 0.8.h,),
                      Row(children: [
                        Icon(Icons.warning_amber_sharp,color: Colors.white,size: 18.sp,),
                        SizedBox(width: 2.w,),
                        Text("Note:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],),
                      SizedBox(height: 0.8.h,),
                      Expanded(child: Text(description!,style: TextStyle(color: Colors.white,fontSize: 14.sp),))


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
