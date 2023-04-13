import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key, required this.image, required this.pressed}) : super(key: key);
final String image;
final GestureTapCallback pressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 25.sp),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.grey.withOpacity(0.2) : Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
                0, 3), // changes position of shadow
          ),
        ],color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.white.withOpacity(3.6.sp) : Colors.white,borderRadius: BorderRadius.circular(16.sp)),
        child: Column(
          children: [
            Expanded(child: AppSVG(assetName: image)),
            SizedBox(height: 2.h,),
            Text("${S().followUS}",style: TextStyle(fontSize: 16.sp,color: MyShared.getInt(key: MySharedKeys.theme) == 1 ? Colors.black : Colors.black,fontWeight: FontWeight.bold),)
          ],
        ),

      ),
    )
    ;
  }
}
