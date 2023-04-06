import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DropDownTextFormField extends StatefulWidget {
  DropDownTextFormField({Key? key, required this.textColor, required this.hint, this.validators, required this.controller, required this.textInputAction, required this.textInputType, required this.enabled, required this.dropDownList}) : super(key: key);
  final Color textColor;
  final String hint;
  final FormFieldValidator<dynamic>? validators;
  final SingleValueDropDownController  controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  final List<DropDownValueModel> dropDownList;
  EdgeInsetsGeometry? padding;
  final bool enabled;

  @override
  State<DropDownTextFormField> createState() => _DropDownTextFormFieldState();
}


class _DropDownTextFormFieldState extends State<DropDownTextFormField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [
          DropDownTextField(
              clearOption: false,
              onChanged: (value){
                print(value);
              },

              validator: widget.validators,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              textFieldDecoration: InputDecoration(
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


          ),
        ],
      ),
    );
  }

}

