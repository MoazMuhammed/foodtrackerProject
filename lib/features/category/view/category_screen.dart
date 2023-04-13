import 'package:flutter/material.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/category/widget/card_allergy_type_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarWidget(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 20.sp),
            child: Text("${S().allergyType}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
          ),
          const CardAllergyTypeWidget()        ],
      ),
    );
  }
}
