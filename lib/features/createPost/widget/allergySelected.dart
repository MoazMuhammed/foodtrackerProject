import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class DropDownTextFormField extends StatefulWidget {
  DropDownTextFormField({Key? key,  required this.hint, this.validators, required this.controller, required this.enabled, required this.dropDownList,  this.count = 0}) : super(key: key);
  final String hint;
  final FormFieldValidator<dynamic>? validators;
  final SingleValueDropDownController  controller;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  final List<DropDownValueModel> dropDownList;
  EdgeInsetsGeometry? padding;
  final bool enabled;
  final int count;

  @override
  State<DropDownTextFormField> createState() => _DropDownTextFormFieldState();
}


class _DropDownTextFormFieldState extends State<DropDownTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
        dropDownItemCount: widget.count,

        clearOption: false,
        onChanged: (value){
          print(value);
        },

        validator: widget.validators,
        controller: widget.controller,
        textFieldDecoration: InputDecoration(
          enabled: false,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
          ),
          hintText: widget.hint,
          focusColor: Colors.grey.shade200,
          fillColor: Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.black,
          filled: true,
          hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey
          ),

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
        searchDecoration: InputDecoration(
          enabled: false,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
          ),
          hintText: widget.hint,
          focusColor: Colors.grey.shade200,
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey
          ),

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
        dropDownList: widget.dropDownList


    );
  }

}


