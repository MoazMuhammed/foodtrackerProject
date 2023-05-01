import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/createPost/view/create_post_screen.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pushAndRemoveUntil(context, MainScreens()),
          child: Row(
            children: [
              AppSVG(
                assetName: 'logo',
                height: 4.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                height: 4.h,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide( width: 0.2.w, color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white
                        ),
    )),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Food Tracker',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              )
            ],
          ),
        ),
        const Spacer(),
        AppSVG(assetName: 'cart', height: 2.9.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,),
        SizedBox(
          width: 3.w,
        ),
        GestureDetector(
            onTap: () => push(context, CreatePostScreen()),
            child: AppSVG(assetName: 'addPost', height: 2.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
        SizedBox(
          width: 3.w,
        ),
        GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: AppSVG(assetName: 'drawer', height: 2.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
      ],
    );
  }
}
