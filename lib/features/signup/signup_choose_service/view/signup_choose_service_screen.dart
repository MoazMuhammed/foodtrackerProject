import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
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
  @override
  Widget build(BuildContext context) {
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
                    decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(10.sp)),
                  ),
                ),
                SizedBox(width: 3.w,),
                Expanded(
                  child: Container(
                    height: 1.h,
                    width: 2.w,
                    decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.circular(10.sp)),
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
                const Expanded(child: SignUpContainer(image: 'login', title: 'Doctor',)),
                SizedBox(width: 10.w,),
                const Expanded(child: SignUpContainer(image: 'login', title: 'Patient',)),
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
}
