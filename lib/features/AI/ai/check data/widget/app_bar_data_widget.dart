import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarDataCheckWidget extends StatelessWidget {
  const AppBarDataCheckWidget({Key? key, required this.title,}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => pop(context),
                child: AppSVG(assetName: 'arrow')),
            SizedBox(
              width: 2.w,
            ),
            Text(title, style: TextStyle(fontSize: 17.sp)),
            Spacer(),
            SizedBox(
              width: 3.w,
            ),
            GestureDetector(onTap: () {
              Scaffold.of(context).openEndDrawer();
            },child: AppSVG(assetName: 'drawer', height: 3.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
            SizedBox(
              height: 6.h,
            ),
          ],
        ),
      ],
    );
  }
}
