import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField({
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
     this.title = "",  this.obscureText = false, this.enable,
    this.isImage = false,  this.uploadMedicalId, this.prefixIcon,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final TextInputType keyboardType;
  final VoidCallback? uploadMedicalId;
  final String title ;
  final bool isPassword;
  final bool isImage;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final IconData? icon;
  final bool? enable;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;

 late bool obscureText;


  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp,vertical: 6.sp),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          TextFormField(
            validator: widget.validators,
            obscureText: widget.obscureText,
            controller: widget.controller,
            enabled: widget.enable,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              focusColor: AppColors.black,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.container,width: 0.2.w)),prefixIcon:widget.prefixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp))),
              suffixIcon: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Visibility(
                    visible: widget.isImage,
                    child: InkWell(
                      onTap: widget.uploadMedicalId,
                      child: AppSVG(assetName: "upload"),
                    ),
                  ),
                  Visibility(
                    visible: widget.isPassword,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.obscureText = !widget.obscureText;
                        });
                      },
                      child: Icon(
                        widget.obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                      ),
                    ),
                  ),
                ],
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
