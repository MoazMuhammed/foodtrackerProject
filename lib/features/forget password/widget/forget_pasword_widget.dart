import 'package:flutter/material.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key, required this.onPressed}) : super(key: key);
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 20.sp),
              child:  Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    S().forgetPasswordLogin,
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp),
                  ))),
        ),
        SizedBox(
          height: 1.5.h,
        ),
      ],
    );
  }
}
