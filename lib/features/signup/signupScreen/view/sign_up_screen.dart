import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/internet/internet_cubit.dart';
import 'package:foodtracker/core/cubits/signup/sign_up_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/internet_disconnected_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/login/widget/social_media_widget.dart';
import 'package:foodtracker/features/signup/congratulate/view/congratulate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  final cubit = SignUpCubit();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            showLoading();
            pushAndRemoveUntil(context, CongratulateScreen());
            hideLoading();
          }
          if (state is SignUpLoading) {
            showLoading();
          }
          if (state is SignUpFailure) {
            showError(state.failureMassege);
          }
        },
        child: SafeArea(
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
                  style:
                      TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
                )),
                SizedBox(
                  height: 4.h,
                ),
                const AppSVG(assetName: 'register'),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                        hint: 'Enter Your UserName',
                        keyboardType: TextInputType.name,
                        controller: userNameController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        title: 'UserName'),
                    AppTextField(
                        hint: 'Enter Your Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        title: 'Email'),
                    AppTextField(
                        hint: 'Enter Your Phone',
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.phone,
                        title: 'Phone'),
                    AppTextField(
                        hint: 'Enter Your Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
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
                          return null;
                        },
                        title: 'Password'),
                    AppTextField(
                        hint: 'ReEnter Your Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        validators: (value) {
                          if (value == null) {
                            return 'password is required';
                          }
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            return "password doesn't match";
                          }
                          return null;
                        },
                        title: 'Confirm Password'),

                    SizedBox(
                      height: 3.h,
                    ),
                    AppButton(
                      onPressed: () {
                        cubit.userRegister(
                          username: userNameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password1: passwordController.text,
                          password2: confirmPasswordController.text,
                        );
                      },
                      label: 'Sign Up',
                      sizeFont: 16.sp,
                      bgColor: AppColors.primary,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Center(
                      child: Text(
                        "--------------------- OR ---------------------",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17.sp),
                      ),
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
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
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
        )),
      ),
    );
  }
}
