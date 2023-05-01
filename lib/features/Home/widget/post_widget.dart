import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/Home/view/comment_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'reacts_widget.dart';
import 'text_form_field_comment.dart';

class PostWidget extends StatefulWidget {
  const PostWidget(
      {Key? key,
      required this.name,
      required this.time,
      required this.title,
      this.image,
      required this.likes, required this.onPressed, required this.onPressed1})
      : super(key: key);
  final String name;
  final String time;
  final String title;
  final String? image;
  final int likes;
  final GestureTapCallback onPressed;
  final GestureTapCallback onPressed1;


  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 2.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const AppSVG(
                  assetName: 'profile',
                ),
                SizedBox(
                  width: 2.5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    Text(
                      widget.time,
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () => push(context, CommentScreen()),
                  child: Text(
                    '${S().follow}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                AppSVG(
                  assetName: 'points',
                  color: MyShared.getInt(key: MySharedKeys.theme) == 1
                      ? Colors.white
                      : Colors.black,
                  height: 0.5.h,
                )
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: ReadMoreText( widget.title,trimExpandedText: "Show Less",trimCollapsedText: "Show More",trimLines: 3,textAlign: TextAlign.justify,trimMode: TrimMode.Line,lessStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary),moreStyle: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary),
              ),
              ),
            SizedBox(height: 1.8.h),
            Center(
              child: Image(
                 image: NetworkImage("${widget.image}"),
                 fit: BoxFit.fill),
            ),
            SizedBox(height: 1.8.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
              child: Row(
                children: [
                  ReactWidget(
                    image: 'love',
                    number: widget.likes,
                    onPressed: () {},
                  ),
                  SizedBox(width: 1.w,),
                  Container(
                    height: 5.8.h,width: 59.sp,
                    child: AppComment(
                      hint: "${S().addComment}",
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      textInputAction: TextInputAction.send,
                      textInputType: TextInputType.text,

                    ),
                  ),
                  ReactWidget(
                    image: 'love',
                    number: widget.likes,
                    onPressed: widget.onPressed1,
                  ),


                ],
              ),
            ),
    ])));
  }
}
