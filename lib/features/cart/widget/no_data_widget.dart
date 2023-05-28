import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  State<NoDataWidget> createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ForgetPasswordBarWidget(onPressed: () => pop(context), title: "Allergy Details"),
          SizedBox(height: 5.h),
          AppSVG(assetName: "noData"),
          SizedBox(height: 2.h),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_sharp,
                  color: Colors.red,
                ),
                Text("Note",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 1.sp,horizontal: 20.sp),
              child: Text(
                "Sorry, there are no products available for this type of allergy, but one of the most important tips that you must follow is that you should stay away from products or foods that cause this type of allergy, and in the future if products are available for it, you will be informed",
              style: TextStyle(fontSize: 16.sp),textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
