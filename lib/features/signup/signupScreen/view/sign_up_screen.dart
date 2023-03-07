import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/app_text_faild.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/login/widget/social_media_widget.dart';
import 'package:foodtracker/features/signup/congratulate/view/congratulate.dart';
import 'package:foodtracker/features/signup/signup_choose_service/view/signup_choose_service_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
                child: Text(
              "A little Left To Finish",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
            )),
            SizedBox(
              height: 4.h,
            ),
            const AppSVG(assetName: 'register'),
            SizedBox(
              height: 3.h,
            ),
            Column(
              children: [
                AppTextField(
                    hint: 'Enter Your Name',
                    keyboardType: TextInputType.name,
                    controller: TextEditingController(),
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    title: 'Name'),
                AppTextField(
                    hint: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(),
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    title: 'Email'),
                AppTextField(
                    hint: 'Enter Your Name',
                    keyboardType: TextInputType.phone,
                    controller: TextEditingController(),
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,
                    title: 'Phone'),
                AppTextField(
                    hint: 'Enter Your Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: TextEditingController(),
                    isPassword: true,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.visiblePassword,
                    validators: (value) {
                      if (value == null) {
                        return 'password is required';
                      }
                      if (value.length < 6) {
                        return 'password must be more than 6 digits';
                      }
                    },
                    title: 'Password'),
                AppTextField(
                    hint: 'ReEnter Your Password',
                    keyboardType: TextInputType.visiblePassword,
                    controller: TextEditingController(),
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    validators: (value) {
                      if (value == null) {
                        return 'password is required';
                      }
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'password doesn,t match';
                      }
                    },
                    title: 'Confirm Password'),
                Visibility(
                  visible:
                      MyShared.getBoolean(key: MySharedKeys.isDoctor) == true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      AppSVG(assetName: 'doctor'),
                      Text("Add Medical license ")
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                AppButton(
                  onPressed: () {
                    push(context, CongratulateScreen());
                  },
                  label: 'Sign Up',
                  sizeFont: 16.sp,
                  bgColor: AppColors.primary,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "--------------------- OR ---------------------",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaWidget(
                      image: 'fb',
                      onPressed: () {},
                      name: 'FaceBook',
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SocialMediaWidget(
                      image: 'google',
                      onPressed: () {},
                      name: 'Gmail',
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do You Have an Account?",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 1.w,
                ),
                GestureDetector(
                    onTap: () {
                      push(context, const LoginScreen());
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: AppColors.signUp,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 4.h,
            )
          ],
        ),
      ),
    ));
  }
}
