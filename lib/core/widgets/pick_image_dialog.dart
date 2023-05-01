import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future dialogBuilder(BuildContext context,final VoidCallback onCameraPressed,final VoidCallback onGalleryPressed ) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return  AlertDialog(
          alignment: AlignmentDirectional.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),

          actions :[ Padding(
            padding:  EdgeInsets.all(18.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onCameraPressed,
                  child: Column(
                    children: [
                      Icon(Icons.camera_alt,color: AppColors.primary,size: 22.sp,),
                      Text("Camera")
                    ],
                  ),
                ),
                SizedBox(width: 3.w,),
                InkWell(
                  onTap: onGalleryPressed,
                  child: Column(
                    children: [
                      Icon(Icons.photo_size_select_actual_outlined,color: AppColors.primary,size: 22.sp,),
                      Text("Gallery")
                    ],
                  ),
                )
              ],
            ),
          ),
          ]
      );
    },
  );
}

