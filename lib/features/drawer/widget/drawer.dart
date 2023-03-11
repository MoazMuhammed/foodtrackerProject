import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/drawer/widget/list_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          SizedBox(
            height: 15.h,
          ),
          Container(
              child: Center(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5.w),
                          borderRadius: BorderRadius.circular(14.sp)),
                      child: AppImage(
                          imageUrl:
                          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                          width: 20.w,
                          height: 9.h,
                          borderRadius: BorderRadius.circular(20.sp)))
                ]),
                SizedBox(height: 2.h,),
                Text(
                  "Moaz Muhammed Atiya",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                )
              ],
            ),
          )),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: ToggleSwitch(
              initialLabelIndex: 0,
              totalSwitches: 2,
              activeBgColor: [AppColors.primary],
              inactiveBgColor: Colors.black12,
              customWidths: [25.w, 25.w],
              labels: ['Dark', 'Light'],
              customIcons: [
                Icon(
                  Icons.dark_mode,
                  color: Colors.white,
                ),
                Icon(
                  Icons.light_mode,
                  color: Colors.white,
                )
              ],
              onToggle: (index) {},
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                ListViewDrawer(
                  title: "Settings",
                  onTap: () {},
                  icon: 'settings',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                ListViewDrawer(
                  title: "Location",
                  onTap: () {},
                  icon: 'location',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                ListViewDrawer(
                  title: "Connect Us",
                  onTap: () {},
                  icon: 'contactUS',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                ListViewDrawer(
                  title: "Chat",
                  onTap: () {},
                  icon: 'chat',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                ListViewDrawer(
                  title: "Help Center",
                  onTap: () {},
                  icon: 'help',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                ListViewDrawer(
                  title: "Terms & Conditions",
                  onTap: () {},
                  icon: 'terms',
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              AppButton(
                onPressed: () {},
                label: 'LogOut',
                sizeFont: 16.sp,
                bgColor: AppColors.primary,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
