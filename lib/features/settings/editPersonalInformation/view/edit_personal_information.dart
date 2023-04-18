import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditPersonalInformation extends StatelessWidget {
  const EditPersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPasswordBarWidget(
                onPressed: () => pop(context),
                title: "Edit Personal Information"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp,vertical: 20.sp),
              child: Row(
                children: [
                  Stack(children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2.w),
                            borderRadius: BorderRadius.circular(20.sp),
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                        child: AppImage(
                            imageUrl:
                                "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=",
                            width: 35.sp,
                            height: 35.sp,
                            borderRadius: BorderRadius.circular(20.sp)))
                  ]),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Update Your Picture",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 0.9.h,
                        ),
                        AppButton(
                          onPressed: () {},
                          label: "Update",
                          sizeFont: 16.sp,
                          borderRadius: BorderRadius.circular(12.sp),
                          margin: EdgeInsets.symmetric(horizontal: 30.sp,),
                          padding: EdgeInsets.symmetric(horizontal: 1.sp),
                          bgColor: AppColors.primary,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            AppTextField(
                hint: MyShared.getString(key: MySharedKeys.email),
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
                isPassword: false,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.name,
                title: "Name *"),
            AppTextField(
              hint: MyShared.getString(key: MySharedKeys.email),
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(),
              isPassword: false,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              title: "Email *",
            ),
            AppTextField(
              hint: MyShared.getString(key: MySharedKeys.email),
              keyboardType: TextInputType.phone,
              controller: TextEditingController(),
              isPassword: false,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.phone,
              title: "Phone Number *",
            ),
            AppTextField(
              hint: MyShared.getString(key: MySharedKeys.email),
              keyboardType: TextInputType.visiblePassword,
              controller: TextEditingController(),
              isPassword: true,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.visiblePassword,
              title: "Password *",
            ),
            SizedBox(
              height: 3.h,
            ),
            AppButton(
              onPressed: () {},
              label: "Update",
              sizeFont: 16.sp,
              borderRadius: BorderRadius.circular(11.sp),
              bgColor: AppColors.primary,
            )
          ],
        ),
      ),
    ));
  }
}
