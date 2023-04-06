import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/Home/widget/comment_widget.dart';
import 'package:foodtracker/features/Home/widget/text_form_field_comment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ForgetPasswordBarWidget(
              onPressed: () => pop(context), title: "Comments"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 20.sp),
              child: ListView.builder(
                  itemBuilder: (context, index) => CommentWidget(),
                  itemCount: 100),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
            child: Row(
              children: [
                AppImage(
                    imageUrl:
                        "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=",
                    width: 30.sp,
                    height: 30.sp,
                    borderRadius: BorderRadius.circular(30.sp)),
                Expanded(
                  child: AppComment(
                      hint: "Add Comment for people",
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      textInputAction: TextInputAction.send,
                      textInputType: TextInputType.text,),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
