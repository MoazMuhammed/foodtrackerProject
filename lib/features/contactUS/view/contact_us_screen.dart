import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/contactUS/widget/message_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: ForgetPasswordBarWidget(
                    onPressed: () => pop(context), title: "Contact Us")),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Talk To Our Team",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "It Has Survived Not Only Five Centuries, But Also The Leap Into Electronic Typesetting, Remaining Essentially Unchanged. It Was Popularised In The 1960S With The Release",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.sp),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.sp),border: Border.all(color: Colors.black.withOpacity(0.3)),),
                child: Column(
                  children: [
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.email),
                      keyboardType: TextInputType.name,
                      controller: TextEditingController(),
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "First Name",
                    ),
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.email),
                      keyboardType: TextInputType.name,
                      controller: TextEditingController(),
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "Last Name",
                    ),
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.email),
                      keyboardType: TextInputType.name,
                      controller: TextEditingController(),
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "Email Address",
                    ),
                    AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.email),
                      keyboardType: TextInputType.name,
                      controller: TextEditingController(),
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "Phone number",
                    ),
                    MessageWidget(
                      hint: "Write Here Your Message",
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      isPassword: false,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      title: "Your message", minLine: 2, maxLine: 7,
                    ),
                  ],
                ),
              ),
            ),
        
            SizedBox(
              height: 2.h,
            ),
            AppButton(
              onPressed: () {},
              label: "Send",
              sizeFont: 16.sp,
              borderRadius: BorderRadius.circular(12.sp),
              bgColor: AppColors.primary,
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    ));
  }
}
