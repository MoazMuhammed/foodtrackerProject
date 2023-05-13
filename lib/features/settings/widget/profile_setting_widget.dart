import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingWidget extends StatelessWidget {
  const ProfileSettingWidget({Key? key, required this.onPressed}) : super(key: key);
final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return           GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 16.sp),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 20.sp),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(16.sp)),
          child: Row(
            children: [
              Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.2.w),
                        borderRadius: BorderRadius.circular(20.sp),color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white),
                    child: AppImage(
                        imageUrl:
                        "http://16.16.212.179"+ MyShared.getString(key: MySharedKeys.userImage),
                        width: 35.sp,
                        height: 35.sp,
                        borderRadius: BorderRadius.circular(20.sp)))
              ]),
              SizedBox(width: 3.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Moaz Muhammed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                  Text(MyShared.getString(key: MySharedKeys.email),style: TextStyle(fontSize: 14.sp),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
