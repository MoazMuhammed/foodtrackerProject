import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AppSearch extends StatefulWidget {
  AppSearch({
    Key? key,
    required this.hint,
    required this.keyboardType,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    this.icon,
    required this.controller,
    this.validators,
    required this.textInputAction,
    required this.textInputType, this.onChanged,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final TextInputType keyboardType;

  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final IconData? icon;
  final VoidCallback? onChanged;
      BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Container(
            height: 4.h,
            child: TextFormField(
              onChanged: (value) => widget.onChanged,
              textAlign: TextAlign.start,
              validator: widget.validators,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                focusColor: AppColors.black,
                prefixIcon: Icon(Icons.search,color: Colors.black54,size: 17.sp,),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black.withOpacity(0.5))),
                border: OutlineInputBorder(
                    ),
                hintText: widget.hint,hintStyle: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
          SizedBox(height: 1.h,)
        ],
      ),
    );
  }
}
