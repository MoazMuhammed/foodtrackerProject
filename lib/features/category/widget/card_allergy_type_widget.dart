import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardAllergyTypeWidget extends StatefulWidget {
  const CardAllergyTypeWidget({Key? key}) : super(key: key);

  @override
  State<CardAllergyTypeWidget> createState() => _CardAllergyTypeWidgetState();
}

class _CardAllergyTypeWidgetState extends State<CardAllergyTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 19,
                mainAxisExtent: 240),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey),
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                      AppImage(imageUrl: "https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg", width: double.infinity, height: double.infinity, borderRadius: BorderRadius.circular(14.sp)),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
                        child: Text(
                          'Eggs Allergy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,fontSize: 16.sp),
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
              );
            }));
  }
}
