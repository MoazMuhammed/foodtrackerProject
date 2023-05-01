import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/Home/view/home_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreatePostBarWidget extends StatelessWidget {
  const CreatePostBarWidget(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => pop(context),
                child: AppSVG(
                  assetName: 'arrow',
                  height: 2.5.h,
                )),
            SizedBox(width: 2.w,),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            )
          ],
        ),
        const Spacer(),
        Expanded(
          child: AppButton(onPressed: onPressed, label: "Create", sizeFont: 14.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(14.sp)),
        )
      ],
    );
  }
}
