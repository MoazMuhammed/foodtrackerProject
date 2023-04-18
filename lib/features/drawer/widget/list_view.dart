import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListViewDrawer extends StatelessWidget {
  const ListViewDrawer(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  final String icon;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      leading: Container(
          padding: EdgeInsets.only(right: 20.sp),
          decoration: BoxDecoration(
        ),
          child: AppSVG(assetName: icon,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,width: 5.w,)),
      title: Text(title, style: TextStyle(fontSize: 16.sp,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)),
      onTap: onTap,
    );
  }
}
