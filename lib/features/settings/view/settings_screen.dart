import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/userData/user_data_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/profile/view/profile_screen.dart';
import 'package:foodtracker/features/settings/editPersonalInformation/view/edit_personal_information.dart';
import 'package:foodtracker/features/settings/widget/language_dialog.dart';
import 'package:foodtracker/features/settings/widget/profile_setting_widget.dart';
import 'package:foodtracker/features/settings/widget/setting_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ForgetPasswordBarWidget(
                  onPressed: () => pop(context), title: "Settings"),
              ProfileSettingWidget(
                onPressed: () => push(context, ProfileScreen()),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.sp, horizontal: 22.sp),
                child: Text("Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.sp)),
              ),
              SettingWidget(
                image: 'editProfile',
                title: 'Edit Personal Information',
                onPressed: () => push(context, EditPersonalInformation()),
              ),
              SettingWidget(
                image: 'lang',
                title: 'Language',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => LanguageDialog());
                },
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                child: AppButton(
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear();
                      pushAndRemoveUntil(context, LoginScreen());
                    },
                    label: "LogOut",
                    sizeFont: 16.sp,
                    bgColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(14.sp),
                    margin: EdgeInsets.symmetric(horizontal: 35.sp)),
              ),
            ],
          ),
        ));

  }
}
