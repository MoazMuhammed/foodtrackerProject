import 'package:flutter/material.dart';
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
              child: const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    "Forget password?",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ))),
        ),
        SizedBox(
          height: 1.5.h,
        ),
      ],
    );
  }
}
