import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(
                vertical: 10.sp, horizontal: 20.sp),
            child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text("Forget password?",style: TextStyle(fontWeight: FontWeight.w600),))),
        SizedBox(height: 1.5.h,),

      ],

    );
  }
}
