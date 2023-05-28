import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/internet/internet_cubit.dart';
import 'package:foodtracker/core/cubits/language/language_cubit.dart';
import 'package:foodtracker/core/cubits/login_user/login_user_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/internet_disconnected_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/forget%20password/widget/forget_pasword_widget.dart';
import 'package:foodtracker/features/forget%20password/view/forget_password_screen.dart';
import 'package:foodtracker/features/login/widget/social_media_widget.dart';
import 'package:foodtracker/features/signup/signup_choose_service/view/signup_choose_service_screen.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
late LanguageCubit languageCubit;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageCubit = context.read<LanguageCubit>();
  }

  final _formKey = GlobalKey<FormState>();
  final cubit = LoginUserCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginUserCubit, LoginUserState>(
        listener: (context, state) {
          if (state is LoginUserLoading) {
            showLoading();
          }
          if (state is LoginUserSuccess) {
            hideLoading();
            pushAndRemoveUntil(context, MainScreens());
          }
          if (state is LoginUserFailure) {
            hideLoading();
            showError("Email or Password is wrong");
          }
        },
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
    if (state is ConnectedState) {
      return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.sp, horizontal: 20.sp),
                      child: Text(
                        S().signIn,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            S().welcome,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(S().enjoy,
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 16.sp)),
                          SizedBox(
                            height: 3.h,
                          ),
                          AppSVG(
                            assetName: 'login',
                            height: 21.h,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppTextField(
                            hint: S().enterEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            isPassword: false,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            title: S().email,
                            validators: (value) {
                              if (value == null) {
                                return 'email is required';
                              }
                              if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "Email not valid";
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            hint: S().enterPassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            isPassword: true,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType
                                .visiblePassword,
                            title: S().password,
                            validators: (value) {
                              if (value == null) {
                                return 'password is required';
                              }
                              if (value
                                  .toString()
                                  .length < 6) {
                                return "password not valid";
                              }
                              return null;
                            },
                          ),
                          ForgetPassword(
                            onPressed: () {
                              push(context,
                                  const ForgetPasswordScreen());
                            },
                          ),
                          SizedBox(height: 3.h,),
                          AppButton(
                            onPressed: () {
                              cubit.userUserLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            },
                            label: S().signIn,
                            sizeFont: 16.8.sp,
                            bgColor: AppColors.primary,
                            borderRadius: BorderRadius.circular(10.sp),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.sp, vertical: 10.sp),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S().haveAcc,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    push(
                                        context,
                                         SignUpChooseService());
                                  },
                                  child: Text(
                                    S().signUp,
                                    style: TextStyle(
                                        color: AppColors.signUp,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    }
    else if (state is NotConnectedState){
      InternetDisconnectedWidget()  ;
    }
    return InternetDisconnectedWidget()  ;

          },
        ),
      ),
    );
  }
}
