import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/userData/user_data_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettingWidget extends StatefulWidget {
  const ProfileSettingWidget({Key? key, required this.onPressed})
      : super(key: key);
  final GestureTapCallback onPressed;

  @override
  State<ProfileSettingWidget> createState() => _ProfileSettingWidgetState();
}

class _ProfileSettingWidgetState extends State<ProfileSettingWidget> {
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
          return GestureDetector(
            onTap: widget.onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 12.sp, horizontal: 20.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(16.sp)),
                child: Row(
                  children: [
                    Stack(children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.2.w),
                              borderRadius: BorderRadius.circular(20.sp),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                          child: AppImage(
                              imageUrl: "http://16.16.212.179" +
                                  cubitUserDetails.userData.profilePic,
                              width: 35.sp,
                              height: 35.sp,
                              borderRadius: BorderRadius.circular(20.sp)))
                    ]),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubitUserDetails.userData.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.sp),
                        ),
                        Text(
                          cubitUserDetails.userData.email,
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
