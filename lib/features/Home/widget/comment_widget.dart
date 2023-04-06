import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({Key? key}) : super(key: key);

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
              AppImage(imageUrl: "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=", width: 25.sp, height: 25.sp, borderRadius: BorderRadius.circular(30.sp)),
              SizedBox(width: 2.w,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Text("Moaz Muhammed",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                          SizedBox(width: 1.w,),
                          Text("3d",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.grey),),

                        ],
                      ),
                      Text("How sweet",style: TextStyle(fontSize: 15.sp),),

                    ],),
                  SizedBox(width: 30.w,),
                  Icon(CupertinoIcons.heart),

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
