import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/internet/internet_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/internet_disconnected_widget.dart';
import 'package:foodtracker/features/login/view/login_screen.dart';
import 'package:foodtracker/features/signup/signupScreen/view/sign_up_screen.dart';
import 'package:foodtracker/features/signup/signup_choose_service/widget/signup_choose_service_container_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpChooseService extends StatefulWidget {
  const SignUpChooseService({Key? key}) : super(key: key);

  @override
  State<SignUpChooseService> createState() => _SignUpChooseServiceState();
}

class _SignUpChooseServiceState extends State<SignUpChooseService> {
  bool doctor = false;

@override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
  builder: (context, state) {
    if(state is ConnectedState){
      return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30.sp),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            push(context, const LoginScreen());
                          },
                          child: const AppSVG(assetName: 'arrow')),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.sp,
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 45.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.h,
                          width: 2.w,
                          decoration: BoxDecoration(color: doctor == true ?AppColors.primary: Colors.grey,borderRadius: BorderRadius.circular(10.sp)),
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      Expanded(
                        child: Container(
                          height: 1.h,
                          width: 2.w,
                          decoration: BoxDecoration(color:doctor == false ? AppColors.primary: Colors.grey,borderRadius: BorderRadius.circular(10.sp)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h,),
                Text(
                  "Sign Up As  !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Text(
                  "Choose Your Service Type",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17.sp),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Row(
                    children: [
                      Expanded(child: SignUpContainer(image: 'doctor', title: 'Doctor', onPressed: () {
                        doctor = true;
                        MyShared.putBoolean(key: MySharedKeys.isDoctor, value: true);
                      safePrint(MyShared.getBoolean(key: MySharedKeys.isDoctor));



                        setState(() {

                        });
                      },)),
                      SizedBox(width: 10.w,),
                      Expanded(child: SignUpContainer(image: 'patient', title: 'Patient', onPressed: () {
                        doctor = false;
                          MyShared.putBoolean(key: MySharedKeys.isDoctor, value: false);
                        safePrint(MyShared.getBoolean(key: MySharedKeys.isDoctor) );

                        setState(() {

                        });
                        },)),
                    ],
                  ),
                ),
                SizedBox(height: 4.h,),
                Text("It is a long established fact that a reader\n will be distracted by the readable\n content of a",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 15.sp),),
                SizedBox(height: 5.h,),
                AppButton(onPressed: () {
                  push(context, SignUpScreen());
                }, label: 'Continue', sizeFont: 16.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(12.sp),)
              ],
            ),
          ));
    }
    else if (state is NotConnectedState){
      InternetDisconnectedWidget()  ;
    }
    return InternetDisconnectedWidget()  ;
  },
);
  }
}
