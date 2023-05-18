import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/userData/user_data_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/styles/theme_provider.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/chat/view/widget/chat.dart';
import 'package:foodtracker/features/contactUS/view/contact_us_screen.dart';
import 'package:foodtracker/features/drawer/widget/list_view.dart';
import 'package:foodtracker/features/drawer/widget/terms.dart';
import 'package:foodtracker/features/googleMap/view/google_map.dart';
import 'package:foodtracker/features/help%20center/view/help_center.dart';
import 'package:foodtracker/features/lic/view/license_screen.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/profile/view/profile_screen.dart';
import 'package:foodtracker/features/settings/view/settings_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final cubitUserDetails = UserDataCubit();

  @override
  void initState() {
    cubitUserDetails.getUserDetails(id: MyShared.getInt(key: MySharedKeys.UID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitUserDetails,
      child: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          if (state is UserDataLoading) {
            showLoading();
          }
          if (state is UserDataSuccess) {
            hideLoading();
          }
          if (state is UserDataFailure) {
            hideLoading();
            showError("Error");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Drawer(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black87,
              child: Column(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.sp, horizontal: 14.sp),
                  child: GestureDetector(
                    onTap: () => push(context, ProfileScreen()),
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.2.w),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: AppImage(
                                  imageUrl: "http://16.16.212.179" +
                                      cubitUserDetails.userData.profilePic,
                                  width: 38.sp,
                                  height: 38.sp,
                                  borderRadius: BorderRadius.circular(20.sp)))
                        ]),
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.sp),
                            child: Text(
                                cubitUserDetails.userData.username,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey.withOpacity(0.5)
                                    : Colors.white.withOpacity(0.7.sp),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(13, 5), // changes position of shadow
                          ),
                        ]),
                        child: Consumer<ThemeProvider>(
                          builder: (context, provider, child) {
                            return Center(
                              child: ToggleSwitch(
                                initialLabelIndex: provider.currentTheme,
                                totalSwitches: 2,
                                activeBgColor: const [AppColors.primary],
                                inactiveBgColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.white,
                                customWidths: [25.w, 25.w],
                                labels: ['${S().light}', '${S().dark}'],
                                borderColor: [
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : Colors.white
                                ],
                                inactiveFgColor: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.black,
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
                                    provider.changeTheme(index ?? 0);
                                  });
                                },
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
                              title: "${S().settings}",
                              onTap: () {
                                push(context, SettingsScreen());
                              },
                              icon: 'setting',
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            ListViewDrawer(
                              title: "${S().location}",
                              onTap: () {
                                push(context, GoogleMapScreen());
                              },
                              icon: 'location',
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            ListViewDrawer(
                              title: "${S().contactUs}",
                              onTap: () {
                                push(context, const ContactUsScreen());
                              },
                              icon: 'contactUS',
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Visibility(
                              visible: true ,
                              child:
                              MyShared.getBoolean(key: MySharedKeys.userDoctorStatus) == false && MyShared.getBoolean(key: MySharedKeys.userPatientStatus) == false ?
                              ListViewDrawer(
                                title: "Licenses",
                                onTap: () {
                                  push(context, LicenseScreen());
                                },
                                icon: 'terms',
                              ) : Container(),
                            ),

                            SizedBox(
                              height: 0.5.h,
                            ),
                            ListViewDrawer(
                              title: "${S().chat}",
                              onTap: () {
                                push(
                                    context,
                                    Chat(
                                      key: UniqueKey(),
                                    ));
                              },
                              icon: 'chat',
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            ListViewDrawer(
                              title: "${S().helpCenter}",
                              onTap: () {
                                push(context, HelpCenter());
                              },
                              icon: 'help',
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            ListViewDrawer(
                              title: "${S().termsAndCondition}",
                              onTap: () {
                                push(context, TermsScreen());
                              },
                              icon: 'terms',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      AppButton(
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.clear();
                          pushAndRemoveUntil(context, LoginScreen());
                        },
                        label: '${S().logOut}',
                        sizeFont: 16.sp,
                        bgColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(12.sp),
                        padding: EdgeInsets.all(10.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
