import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'reacts_widget.dart';

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
          borderRadius: BorderRadius.circular(19.sp),border: Border.all(color: Colors.white24), color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black54,   boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.withOpacity(0.8)
                : Colors.white38,
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(
                0, 1), // changes position of shadow
          ),
        ],
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 14.sp),
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
                              fontWeight: FontWeight.bold, fontSize: 16.sp)),
                      SizedBox(height: 0.3.h,),
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
                        fontSize: 14.sp),
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
                height: 1.5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: ReadMoreText(
                  widget.title,
                  trimExpandedText: "Show Less",
                  trimCollapsedText: "Show More",
                  trimLines: 3,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,style: TextStyle(fontSize: 16.sp),
                  lessStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                  moreStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              ),
              SizedBox(height: 1.0.h),
              Center(
                child: AppImage(imageUrl: "${widget.image}", width: double.infinity,borderRadius: BorderRadius.circular(14.sp), height: 40.h,),
              ),
              SizedBox(height: 0.6.h,),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.sp),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 18.sp),
                      child: Divider(color: Colors.black,thickness: 2.sp),
                    ),
                    SizedBox(height: 0.5.h,),
                    Row(
                      children: [
                        Expanded(
                          child: ReactWidget(
                            image: 'like',
                            number: "${S().like}",
                            onPressed:widget.like,
                            color: widget.color,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: widget.commentScreen,
                            child: ReactWidget(
                              image: 'comment',
                              number: "${S().comment}",
                              onPressed:widget.commentScreen,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: widget.share,
                            child: ReactWidget(
                              image: 'share',
                              number: "${S().share}",
                              onPressed:widget.share,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
