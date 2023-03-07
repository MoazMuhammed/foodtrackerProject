import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/onBoard/view/on_boarding_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.onPressed,
      required this.onTap})
      : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text(
                "Lets Get Started",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp,),
              ),
            ),
            SizedBox(height: 5.h,),
            Container(margin: EdgeInsets.symmetric(horizontal: 13.sp),child: AppSVG(assetName: image,height: 39.h, width: double.infinity)),
            SizedBox(height: 4.h,),
            Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    subTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            Center(
              child: SmoothPageIndicator(
                controller: indicatorController,
                count: 3,
                effect: SwapEffect(
                    spacing: 11.0.sp,
                    dotWidth: 15.0.sp,
                    dotHeight: 15.0.sp,
                    strokeWidth: 1,
                    paintStyle: PaintingStyle.stroke,
                    dotColor: AppColors.primary,
                    activeDotColor: AppColors.primary),
              ),
            ),
            SizedBox(height: 4.h,),
            Visibility(
              visible: lastPage,
              child: AppButton(
                onPressed: onPressed,
                label: "Start now",
                bgColor: AppColors.primary,
                borderRadius: BorderRadius.circular(10.sp),padding: EdgeInsets.symmetric(horizontal: 25.sp), sizeFont: 16.sp,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
