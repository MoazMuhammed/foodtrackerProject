import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_enter.dart';
import 'package:foodtracker/features/AI/widget/ai_scanner_details.dart';
import 'package:foodtracker/features/AI/widget/ai_scanner_movment.dart';
import 'package:foodtracker/features/AI/widget/ai_scanner_warning.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AIAnalysisContainerWidget extends StatelessWidget {
  const AIAnalysisContainerWidget({Key? key, required this.categoryName, required this.foodName, required this.allergies}) : super(key: key);
final String categoryName;
final String foodName;
final String allergies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 17.sp, horizontal: 18.sp),
        child: Column(
          children: [
            Text(
              "Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            AIScannerDetails(
              title: 'Name :',
              details: categoryName,
            ),
            SizedBox(
              height: 2.h,
            ),
            AIScannerDetails(
              title: 'Results :',
              details: foodName,
            ),
            SizedBox(
              height: 2.h,
            ),
            AIScannerDetails(
              title: 'Ingredients :',
              details: allergies,
            ),
            SizedBox(
              height: 2.h,
            ),
            AIScannerWarning(),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Try Another Service",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AIScannerMovement(
                    image: 'IGE',
                    title: 'IGE Analysis', onPressed: () => pushAndRemoveUntil(context, CheckDataEnter()),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  AIScannerMovement(
                    image: 'AICamera',
                    title: 'Ai Camera', onPressed: () => pop(context)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
