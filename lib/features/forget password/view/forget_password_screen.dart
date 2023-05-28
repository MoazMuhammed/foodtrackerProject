import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/forgetPassword/forget_password_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_congratulation_screen.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_otp_screen.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/generated/intl/messages_ar.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final cubit = ForgetPasswordCubit();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoading) {
            showLoading();
          }
          if (state is ForgetPasswordSuccess) {
            hideLoading();
            showSuccess(messages.toString());
            pushAndRemoveUntil(context,
                const ForgetPasswordCongratulationScreen());
          }
          if (state is ForgetPasswordFailure) {
            hideLoading();
            showError(messages.toString());
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ForgetPasswordBarWidget(
                        onPressed: () {
                          push(context, const LoginScreen());
                        },
                        title: S().forgetPassword,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      const AppSVG(assetName: 'forgetPassword'),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(S().enterEmailToReceiveCode,
                          style:
                          TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.7.sp),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 2.h,
                      ),
                      AppTextField(
                        hint: S().enterEmailToReceiveCode,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        isPassword: false,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      AppButton(
                        onPressed: () {
                          cubit.userForgetPassword(
                            email: emailController.text,);
                        },
                        label: S().sendCode,
                        sizeFont: 17.sp,
                        bgColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(12.sp),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
