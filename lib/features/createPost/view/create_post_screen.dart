import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/contactUS/widget/message_widget.dart';
import 'package:foodtracker/features/createPost/widget/create_post_bar_widget.dart';
import 'package:foodtracker/features/createPost/widget/spinner_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreatePostBarWidget(
              onPressed: () => pop(context), title: "Create Post"),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.sp),
            child: Row(
              children: [
                AppImage(
                    imageUrl:
                        "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=",
                    width: 30.sp,
                    height: 30.sp,
                    borderRadius: BorderRadius.circular(30.sp)),
                SizedBox(width: 1.5.w,),
                Column(
                  children: [
                    Text("Moaz Muhamed ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                  ],
                )
              ],
            ),
          ),
          MessageWidget(
            hint: "Show What's in your Mind ….",
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            isPassword: false,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.text,
            borderRadius: BorderRadius.circular(20.sp),
            minLine: 10,
            maxLine: 12,
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 16.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.sp),
                border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp),
              child: Row(children: [
                Row(
                  children: [
                    AppSVG(assetName: "photoPost"),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text("Photos")
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    AppSVG(assetName: "videoPost"),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text("Videos")
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    )));
  }
}
