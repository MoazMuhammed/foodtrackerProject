import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:foodtracker/generated/l10n.dart';
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
          endDrawer: DrawerWidget(name: MyShared.getString(key: MySharedKeys.email)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  AppBarDataCheckWidget(title: '${S().checkData}',),
                  SizedBox(
                    height: 4.h,
                  ),
                  AppSVG(assetName: 'checkDataResult', height: 22.h),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    "${S().processCompleted}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15.5.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "${S().iGEResult}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 17.sp, vertical: 20.sp),
                child: Row(
                  children: [
                    Text(
                      "${S().iGEResult}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      MyShared.getInt(key: MySharedKeys.iGE).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              Center(
                  child: Text(
                "${S().status}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              )),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 17.sp, vertical: 15.sp),
                    child: Row(
                      children: [
                        AppSVG(
                            assetName:
                                300 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                                        MyShared.getInt(
                                                key: MySharedKeys.iGE) >=
                                            150
                                    ? 'normal'
                                    : 150 >=
                                                MyShared.getInt(
                                                    key: MySharedKeys.iGE) &&
                                            MyShared.getInt(
                                                    key: MySharedKeys.iGE) >=
                                                0
                                        ? 'warm'
                                        : 'danger'),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          300 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                                  MyShared.getInt(key: MySharedKeys.iGE) >= 150
                              ? '${S().normalLevel}'
                              : 150 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                                      MyShared.getInt(key: MySharedKeys.iGE) >=
                                          0
                                  ? '${S().warmingLevel}'
                                  : '${S().dangerLevel}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          300 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                                  MyShared.getInt(key: MySharedKeys.iGE) >= 150
                              ? '150 - 300'
                              : 150 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                                      MyShared.getInt(key: MySharedKeys.iGE) >=
                                          0
                                  ? '0 - 150'
                                  : '> 300',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    300 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                            MyShared.getInt(key: MySharedKeys.iGE) >= 150
                        ? ''
                        : 150 >= MyShared.getInt(key: MySharedKeys.iGE) &&
                                MyShared.getInt(key: MySharedKeys.iGE) >= 0
                            ? '${S().normalLevelDescription}'
                            : '${S().warmingLevelDescription}',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 3.h,),
              Text("${S().iGETotalLevels}",
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17.sp),),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  AppSVG(
                      assetName:
                    'normal'),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text('${S().normalLevel}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    '150 - 300',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  AppSVG(
                      assetName:
                    'warm'),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text('${S().warmingLevel}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    '150 <',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  AppSVG(
                      assetName:
                    'danger'),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text('${S().dangerLevel}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    '> 300',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
