import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPItem extends StatelessWidget {
  const OTPItem({Key? key, required this.first, required this.last}) : super(key: key);
  final bool first;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            focusColor: Colors.grey.shade200,
            fillColor: Colors.grey.shade200,
            filled: true,


            disabledBorder:OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
              borderRadius: BorderRadius.circular(13.0),
            ) ,
            focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
              borderRadius: BorderRadius.circular(13.0),
            ),


            border: OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
              borderRadius: BorderRadius.circular(13.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.grey.shade200, width: 2.0),
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
        ),
      ),
    );

  }
}