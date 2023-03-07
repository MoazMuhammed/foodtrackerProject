import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckDataResult extends StatefulWidget {
  const CheckDataResult({Key? key}) : super(key: key);

  @override
  State<CheckDataResult> createState() => _CheckDataResultState();
}

class _CheckDataResultState extends State<CheckDataResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.sp, vertical: 20.sp),
        child: Column(
          children: [
            AppBarDataCheckWidget(),
            Stack(children: [              AppSVG(assetName: 'circule_text'),

              AppSVG(
                assetName: 'circule_fill',
                color: AppColors.primary,
              ),
            ])
          ],
        ),
      ),
    ));
  }
}
