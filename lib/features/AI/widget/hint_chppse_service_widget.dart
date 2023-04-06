import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HintChooseServiceWidget extends StatelessWidget {
  const HintChooseServiceWidget({Key? key, required this.title, required this.description}) : super(key: key);
final String title,description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Icon(Icons.report_gmailerrorred_sharp,color: AppColors.primary,size: 16.sp,),
          SizedBox(width: 0.5.w,),
          Text(
             title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.black),
          ),
          SizedBox(width: 1.w,),
          Text(
            description,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: Colors.black),textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
