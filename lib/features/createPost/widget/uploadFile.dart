import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key, required this.onPressed, required this.onPressed1, required this.onPressed2, required this.onPressed3}) : super(key: key);
  final VoidCallback onPressed;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final VoidCallback onPressed3;

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:
      EdgeInsets.symmetric(vertical: 14.sp, horizontal: 16.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.sp),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Row(children: [
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 30.h,
                    margin: EdgeInsets.all(20.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 55.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(12.sp)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${S().chooseType}",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color:  Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)),
                                SizedBox(height: 2.h,),
                                AppButton(
                                    onPressed: widget.onPressed,
                                    label: "${S().camera}",
                                    sizeFont: 16.sp,
                                    bgColor: AppColors.primary),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppButton(
                                  onPressed: widget.onPressed1,
                                  label: "${S().gallery}",
                                  sizeFont: 16.sp,
                                  bgColor: AppColors.primary,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                            child: InkWell(
                              onTap: () {
                                pop(context);
                              },
                              child: AppButton(
                                  onPressed: () {
                                    pop(context);
                                  },
                                  label: "${S().back}",
                                  sizeFont: 16.sp,
                                  bgColor: AppColors.container),
                            ))
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                AppSVG(assetName: "photoPost"),
                SizedBox(
                  width: 1.w,
                ),
                Text("${S().photo}")
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 30.h,
                    margin: EdgeInsets.all(20.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 55.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius: BorderRadius.circular(12.sp)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${S().chooseType}",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color:  Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)),
                                SizedBox(height: 2.h,),
                                AppButton(
                                    onPressed: widget.onPressed2,
                                    label: "${S().camera}",
                                    sizeFont: 16.sp,
                                    bgColor: AppColors.primary),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppButton(
                                  onPressed: widget.onPressed3,
                                  label: "${S().gallery}",
                                  sizeFont: 16.sp,
                                  bgColor: AppColors.primary,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                            child: InkWell(
                              onTap: () {
                                pop(context);
                              },
                              child: AppButton(
                                  onPressed: () {
                                    pop(context);
                                  },
                                  label: "${S().back}",
                                  sizeFont: 16.sp,
                                  bgColor: AppColors.container),
                            ))
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                AppSVG(assetName: "videoPost"),
                SizedBox(
                  width: 1.w,
                ),
                Text("${S().video}")
              ],
            ),
          )
        ]),
      ),
    )
    ;
  }
}
