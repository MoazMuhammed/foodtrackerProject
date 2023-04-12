import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ForgetPasswordBarWidget(
                  onPressed: () => pop(context), title: "Terms Of Service"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.sp),
                      child: Container(
                        height: 22.sp,
                        width: 60.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.sp),
                            color: AppColors.primary),
                        child: Center(
                            child: Text(
                          "Last Update On 11 Apr 2023",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp, vertical: 12.sp),
                                height: 25.sp,
                                width: 25.sp,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(30.sp)),
                                child: AppSVG(
                                    assetName: 'documentOne',
                                    color: Colors.white)),
                            Container(
                              height: 10.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.sp),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5.w)),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp, vertical: 12.sp),
                                height: 25.sp,
                                width: 25.sp,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(30.sp)),
                                child: AppSVG(
                                    assetName: 'documentTwo',
                                    color: Colors.white)),
                            Container(
                              height: 10.5.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.sp),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5.w)),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.sp, vertical: 12.sp),
                                height: 25.sp,
                                width: 25.sp,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(30.sp)),
                                child: AppSVG(
                                    assetName: 'documentThree',
                                    color: Colors.white)),
                            Container(
                              height: 12.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12.sp),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5.w)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Introduction',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Welcome to our terms and conditions ("Terms"). These Terms are important and affect your legal rights, so please read them carefully.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Agreement to Terms',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'By accessing or using our Services, you agree to be bound by these Terms. If you do not agree to these Terms, you may not access or use the Services.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Updates to Terms',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'We reserve the right to update or modify these Terms at any time without prior notice. Your use of the Services following any such modification constitutes your agreement to be bound by the modified Terms.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
