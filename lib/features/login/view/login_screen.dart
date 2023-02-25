import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/app_text_faild.dart';
import 'package:foodtracker/features/login/widget/forget_pasword_widget.dart';
import 'package:foodtracker/features/login/widget/social_media_widget.dart';
import 'package:foodtracker/features/signup/signup_choose_service/view/signup_choose_service_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.sp, horizontal: 20.sp),
              child: Text(
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp,),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text("Enjoy Your Journey",
                      style: TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 16.sp)),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppSVG(
                    assetName: 'login',
                    height: 21.h,
                  ),
                  SizedBox(height: 2.h,),
                  AppTextField(
                    hint: "Enter Your Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(),
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    title: 'Email',
                  ),
                  AppTextField(
                    hint: "Enter Your Password",
                    keyboardType: TextInputType.visiblePassword,
                    controller: TextEditingController(),
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    title: 'Password',
                  ),
                  ForgetPassword(),
                  AppButton(
                    onPressed: () {},
                    label: "Sign in",
                    sizeFont: 16.sp,
                    bgColor: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.sp),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 10.sp),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    "--------------------- OR ---------------------",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaWidget(image: 'fb', onPressed: () {}, name: 'FaceBook',),
                      SizedBox(width: 4.w,),
                      SocialMediaWidget(image: 'google', onPressed: () {}, name: 'Gmail',),

                    ],
                  ),
                  SizedBox(height: 4.h,),
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do not You Have an Account?",style: TextStyle(fontSize: 15.sp,fontWeight:FontWeight.bold ), ),
                      SizedBox(width: 1.w,),
                      GestureDetector(onTap: () {
                        push(context, const SignUpChooseService());
                      },child: Text("Sign Up",style: TextStyle(color: AppColors.signUp,fontSize: 15.sp,fontWeight: FontWeight.bold),)),
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
