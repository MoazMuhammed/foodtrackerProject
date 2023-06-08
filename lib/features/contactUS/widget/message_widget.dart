import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class MessageWidget extends StatefulWidget {
  MessageWidget({
    Key? key,
    required this.hint,
    required this.keyboardType,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    this.icon,
    required this.controller,
    required this.isPassword,
    this.validators,
    required this.textInputAction,
    required this.textInputType,
    this.title = "", required this.minLine, required this.maxLine,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final TextInputType keyboardType;

  final String title ;
  final bool isPassword;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final IconData? icon;
  final int minLine;
  final int maxLine;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.sp),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
              ),
            ],
          ),
          TextFormField(
            validator: widget.validators,
            obscureText: obscureText,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            decoration: InputDecoration(
              focusColor: AppColors.black,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.container,width: 0.2.w)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.sp))),
              suffixIcon: Visibility(
                visible: widget.isPassword,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.black,
                  ),
                ),
              ),
              hintText: widget.hint,
            ),
          ),
          SizedBox(height: 1.h,)
        ],
      ),
    );
  }
}
