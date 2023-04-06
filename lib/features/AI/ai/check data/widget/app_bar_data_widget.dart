import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarDataCheckWidget extends StatelessWidget {
  const AppBarDataCheckWidget({Key? key,}) : super(key: key);

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
            Text('Check Data', style: TextStyle(fontSize: 17.sp)),
            Spacer(),
            AppSVG(assetName: 'notify', height: 2.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white),
            SizedBox(
              width: 3.w,
            ),
            GestureDetector(onTap: () {
              Scaffold.of(context).openEndDrawer();
            },child: AppSVG(assetName: 'drawer', height: 2.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
            SizedBox(
              height: 6.h,
            ),
          ],
        ),
      ],
    );
  }
}
