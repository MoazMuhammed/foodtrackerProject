import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardAllergyTypeWidget extends StatefulWidget {
  const CardAllergyTypeWidget({Key? key}) : super(key: key);

  @override
  State<CardAllergyTypeWidget> createState() => _CardAllergyTypeWidgetState();
}

class _CardAllergyTypeWidgetState extends State<CardAllergyTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return AppSVG(assetName: 'milk');
  }
}
