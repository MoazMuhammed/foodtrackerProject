import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({Key? key, required this.name, required this.time, required this.comment, required this.imageProfile}) : super(key: key);
final String name;
final String time;
final String comment;
final String imageProfile;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.sp),
          child: Row(
            children: [
              AppImage(imageUrl: widget.imageProfile, width: 25.sp, height: 25.sp, borderRadius: BorderRadius.circular(30.sp)),
              SizedBox(width: 2.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Text(widget.name,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                          SizedBox(width: 1.w,),
                          Text(widget.time,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.grey),overflow: TextOverflow.ellipsis),

                        ],
                      ),
                      Text(widget.comment,style: TextStyle(fontSize: 15.sp),),

                    ],),

                ],
              )
            ],
          ),
        ),
        SizedBox(height: 1.h,),
        Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),)
      ],
    );
  }
}
