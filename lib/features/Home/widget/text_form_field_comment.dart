import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AppComment extends StatefulWidget {
  AppComment({
    Key? key,
    required this.hint,
    required this.keyboardType,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    required this.icon,
    required this.controller,
    this.validators,
    required this.textInputAction,
    required this.textInputType, this.onChanged, required this.sufColor, required this.enable, required this.onPressed,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final TextInputType keyboardType;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final IconData icon;
  final VoidCallback? onChanged;
  final Color sufColor;
  final bool enable;
  final GestureTapCallback onPressed;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  State<AppComment> createState() => _AppCommentState();
}

class _AppCommentState extends State<AppComment> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Column(
        children: [
          SizedBox(
            height: 0.5.h,
          ),
          Container(
            height: 5.h,
            child: TextFormField(
              onChanged: (value) => widget.onChanged,
              textAlign: TextAlign.start,
              validator: widget.validators,
              controller: widget.controller,
              enabled: widget.enable,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: widget.onPressed,
                    child: Icon(widget.icon,size: 17.sp,color:widget.sufColor )),
                focusColor: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14.sp),
                    borderSide: BorderSide(color:Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.sp)
                ),
                hintText: widget.hint,hintStyle: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
