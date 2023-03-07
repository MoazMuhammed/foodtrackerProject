import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_result.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckDataEnter extends StatefulWidget {
  const CheckDataEnter({Key? key}) : super(key: key);

  @override
  State<CheckDataEnter> createState() => _CheckDataEnterState();
}

class _CheckDataEnterState extends State<CheckDataEnter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarDataCheckWidget(),
              AppSearch(
                  hint: "Enter IGE Total Number",
                  keyboardType: TextInputType.text,
                  controller: TextEditingController(),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () => push(context, CheckDataResult()),
                child: Stack(
                  alignment: Alignment.center,
                  children: [AppSVG(assetName: 'circule',width: 45.w), Text("click For Start Analysis",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
