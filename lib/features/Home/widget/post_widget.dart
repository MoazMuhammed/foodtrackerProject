import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/Home/data/postsModel.dart';
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
      required this.likes,
      required this.onPressed1,
      required this.allergyType,
      required this.share, required this.commentScreen, required this.id, required this.controller, required this.like, required this.onPressed7,  this.color = Colors.black, required this.deletePost, required this.visible, this.imageUser})
      : super(key: key);
  final String name;
  final String time;
  final String title;
  final String? image;
  final String? imageUser;
  final String allergyType;
  final int likes;
  final int id;
  final Color color ;
  final GestureTapCallback onPressed1;
  final GestureTapCallback share;
  final GestureTapCallback commentScreen;
  final GestureTapCallback like;
  final GestureTapCallback onPressed7;
  final GestureTapCallback deletePost;
  final TextEditingController controller;
final bool visible;

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
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 4.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  AppImage(imageUrl: "${widget.imageUser}", width: 10.w, height: 5.h, borderRadius: BorderRadius.circular(18.sp)),
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
                  Text(
                    widget.allergyType,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Visibility(
                    visible: widget.visible,
                    child: InkWell(
                      onTap: widget.deletePost,
                      child: AppSVG(
                        assetName: 'points',
                        color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                        height: 0.5.h,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.sp),
                child: ReadMoreText(
                  widget.title,
                  trimExpandedText: "Show Less",
                  trimCollapsedText: "Show More",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  lessStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                  moreStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              ),
              SizedBox(height: 1.0.h),
              Center(
                child: AppImage(imageUrl: "${widget.image}", width: double.infinity, height: 30.h, borderRadius: BorderRadius.circular(14.sp)),
              ),
              SizedBox(height: 0.6.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
                child: Row(
                  children: [
                    Expanded(
                      child: ReactWidget(
                        image: 'heart',
                        number: widget.likes,
                        onPressed:widget.like,
                        color: widget.color,
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Visibility(
                        visible: true,
                        child: MyShared.getBoolean(key: MySharedKeys.is_doctor)
                            ? Container(
                                height: 5.8.h,
                                width: 59.sp,
                                child: AppComment(borderRadius: BorderRadius.circular(14.sp),
                                  hint: "${S().addComment}",
                                  keyboardType: TextInputType.text,
                                  controller: widget.controller,
                                  textInputAction: TextInputAction.send,
                                  textInputType: TextInputType.text,
                                  icon: Icons.send, sufColor: MyShared.getBoolean(key: MySharedKeys.is_doctor) == true ? AppColors.primary : Colors.grey, enable: MyShared.getBoolean(key: MySharedKeys.is_doctor) == true ? true : false, onPressed:widget.onPressed7,
                                ),
                              )
                            : Container(
                                height: 5.8.h,
                                child: AppComment(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  hint: "Can't comment as "+MyShared.getString(key: MySharedKeys.name),
                                  keyboardType: TextInputType.text,
                                  controller: TextEditingController(),
                                  textInputAction: TextInputAction.none,

                                  textInputType: TextInputType.none, icon: Icons.lock, sufColor: MyShared.getBoolean(key: MySharedKeys.is_doctor) == true ? AppColors.primary : Colors.grey, enable: MyShared.getBoolean(key: MySharedKeys.is_doctor) == true ? true : false,
                                  onPressed: () {
                                    safePrint("context");

                                  },
                                ),
                              ),
                      ),
                      flex: 9,
                    ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                          decoration: BoxDecoration(border: Border.all(width: 0.1.w),borderRadius: BorderRadius.circular(14.sp)),
                          child: GestureDetector(
                              onTap: widget.commentScreen,
                              child: AppSVG(assetName: 'comment',height: 2.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black54:Colors.white,)),
                        ),
                    SizedBox(width: 2.w,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                      decoration: BoxDecoration(border: Border.all(width: 0.1.w),borderRadius: BorderRadius.circular(14.sp)),
                      child: GestureDetector(
                          onTap: widget.share,
                          child: AppSVG(assetName: 'share',height: 2.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)),
                    )
                  ],
                ),
              ),
            ])));
  }
}
