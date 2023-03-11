import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            AppSVG(
              assetName: 'logo',
              height: 4.h,
            ),
            SizedBox(
              width: 2.w,
            ),
            Container(
              height: 4.h,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.black, width: 0.2.w))),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              'Food Tracker',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            )
          ],
        ),
        const Spacer(),
        AppSVG(assetName: 'notify', height: 2.5.h),
        SizedBox(
          width: 3.w,
        ),
        AppSVG(assetName: 'addPost', height: 2.5.h),
        SizedBox(
          width: 3.w,
        ),
        GestureDetector(
            onTap: () {
              safePrint("message");
            },
            child: AppSVG(assetName: 'drawer', height: 2.h)),
      ],
    );
  }
}
