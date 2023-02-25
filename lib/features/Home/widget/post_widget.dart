import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'reacts_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

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
                    const Text(
                      '3 min',
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Follow',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: 13.sp),
                ),
                SizedBox(
                  width: 2.w,
                ),
                const AppSVG(assetName: 'points')
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
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.sp),
                  border: Border.all(
                      width: 0.2.w, color: Colors.grey.shade400),
                ),
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
                    const AppSVG(assetName: 'comment'),
                    SizedBox(
                      width: 3.w,
                    ),
                    const AppSVG(assetName: 'save')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}