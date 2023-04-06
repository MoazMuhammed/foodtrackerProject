import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/styles/theme_provider.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/chat/creditCard/view/credit_card.dart';
import 'package:foodtracker/features/contactUS/view/contact_us_screen.dart';
import 'package:foodtracker/features/drawer/widget/list_view.dart';
import 'package:foodtracker/features/googleMap/view/google_map.dart';
import 'package:foodtracker/features/help%20center/view/help_center.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.black87,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.sp, horizontal: 14.sp),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2.w),
                            borderRadius: BorderRadius.circular(20.sp),color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white),
                        child: AppImage(
                            imageUrl:
                            "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=",
                            width: 41.5.sp,
                            height: 41.5.sp,
                            borderRadius: BorderRadius.circular(20.sp)))
                  ]),
                  SizedBox(height: 1.h,),
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 14.sp),
                      child: Text(MyShared.getString(key: MySharedKeys.email),style: TextStyle(fontSize: 18.sp,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),maxLines: 1),
                    ),
                  )

                ],
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 22.sp),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).brightness == Brightness.light ?Colors.grey.withOpacity(0.5):Colors.white.withOpacity(0.7.sp),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(13, 5), // changes position of shadow
                      ),
                    ]),
                    child: Consumer<ThemeProvider>(
                      builder: (context, provider, child) {
                        return Expanded(
                          child: Center(
                            child: ToggleSwitch(
                              initialLabelIndex: provider.currentTheme,
                              totalSwitches: 2,
                              activeBgColor: const [AppColors.primary],
                              inactiveBgColor:Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.white ,
                              customWidths: [25.w, 25.w],
                              labels: const ['Light', 'Dark'],
                              borderColor: [Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.white],
                              inactiveFgColor: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.black,
                              customIcons: const [
                                Icon(
                                  Icons.light_mode,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.dark_mode,
                                  color: Colors.black54,
                                )
                              ],
                              onToggle: (int? index) {
                                setState(() {

                                  provider.changeTheme(index??0);

                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
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
                        onTap: () {
                          push(context, GoogleMapScreen());
                        },
                        icon: 'location',
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      ListViewDrawer(
                        title: "Contact Us",
                        onTap: () {
                          push(context, const ContactUsScreen());
                        },
                        icon: 'contactUS',
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      ListViewDrawer(
                        title: "Chat",
                        onTap: () {
                          push(context, CreditCard());
                        },
                        icon: 'chat',
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      ListViewDrawer(
                        title: "Help Center",
                        onTap: () {
                          push(context, HelpCenter());
                        },
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
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  children: [
                    AppButton(
                      onPressed: () {},
                      label: 'LogOut',
                      sizeFont: 16.sp,
                      bgColor: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.sp),
                      padding: EdgeInsets.all(10.sp),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
