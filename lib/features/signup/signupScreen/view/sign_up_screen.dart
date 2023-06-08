import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/signup/sign_up_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/signup/congratulate/view/congratulate.dart';
import 'package:foodtracker/generated/l10n.dart';
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
            showError("Enter a valid email address or password");
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
                      '${S().signUp}' ,
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
                        hint: '${S().enterUserName}',
                        keyboardType: TextInputType.name,
                        controller: userNameController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        title: '${S().username}'),
                    AppTextField(
                        hint: '${S().enterEmail}',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        title: '${S().email}'),
                    AppTextField(
                        hint: '${S().enterPhone}',
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        isPassword: false,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.phone,
                        title: '${S().phoneNumber}'),
                    AppTextField(
                        hint: '${S().enterPassword}',
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        isPassword: true,obscureText: true,
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
                        title: '${S().password}'),
                    AppTextField(
                        hint: '${S().enterConfirmPassword}',
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        isPassword: true,
                        textInputAction: TextInputAction.done,obscureText: true,
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
                        title: '${S().confirmNewPassword}'),

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
                  ],
                ),
                SizedBox(height: 1.h,),
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
