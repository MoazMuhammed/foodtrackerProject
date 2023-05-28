import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
Future addReview(
    BuildContext context,
    final VoidCallback onTap,
    final ValueChanged<double> onRatingUpdate,

    ) {
  return showDialog<void>(
    context: context,

    builder: (BuildContext context) {
      return AlertDialog(
          alignment: AlignmentDirectional.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          actions: [
            Padding(
              padding: EdgeInsets.all(18.sp),
              child: Column(
                children: [
                  Text(
                    "Add Review",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.sp),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate:onRatingUpdate,
                  ),
                  SizedBox(height: 2.h,),
                  AppButton(
                    margin: EdgeInsets.all(5.sp),
                    borderRadius: BorderRadius.circular(15.sp),
                    onPressed: onTap,
                    label: 'Send my review',
                    bgColor: AppColors.primary, sizeFont: 14.sp,
                  )
                ],
              ),
            ),
          ]);
    },
  );
}
