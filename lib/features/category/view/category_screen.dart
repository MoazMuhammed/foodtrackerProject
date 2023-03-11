import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:foodtracker/features/category/widget/card_allergy_type_widget.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
          child: AppBarWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 13.sp),
          child: Column(
            children: [
              Text(
                'Allergy Types',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              AppSVG(assetName: 'egg')
            ],
          ),
        ),
      ],
    )));
  }
}
