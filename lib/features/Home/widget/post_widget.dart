import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/Home/view/comment_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'reacts_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

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
        padding:
        EdgeInsets.symmetric(vertical: 10.sp, horizontal: 2.sp),
        child: Column(
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
                    Text("Moaz Muhammed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp)),
                     Text(
                      '3 min',style: TextStyle(fontSize: 13.sp),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${S().follow}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  width: 2.w,
                ),
                 AppSVG(assetName: 'points',color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white : Colors.black,height: 0.5.h,)
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Text(
                  'There are many variations of passages of Lorem Ipsum available',
                  style: TextStyle(fontSize: 14.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 1.4.h,
            ),
            const Image(
                image: AssetImage('assets/images/post.png'),
                fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 10.sp),
              child: Row(
                children: [
                  ReactWidget(
                    image: 'love',
                    number: '35',
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  ReactWidget(
                    image: 'happy',
                    number: '7',
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  ReactWidget(
                    image: 'sad',
                    number: '2',
                    onPressed: () {},
                  ),
                  const Spacer(),
                  GestureDetector(onTap: () => push(context, CommentScreen()),child:  AppSVG(assetName: 'comment',height: 1.6.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
                  SizedBox(
                    width: 3.w,
                  ),
                   AppSVG(assetName: 'save',height: 1.6.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
