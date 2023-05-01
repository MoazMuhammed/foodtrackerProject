import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecommendedProductWidget extends StatefulWidget {
  const RecommendedProductWidget({Key? key, required this.productImage, required this.productName, required this.productPrice, required this.productdetaiils}) : super(key: key);
  final String productImage;
  final String productName;
  final String productPrice;
  final String productdetaiils;


  @override
  State<RecommendedProductWidget> createState() => _RecommendedProductWidgetState();
}

class _RecommendedProductWidgetState extends State<RecommendedProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),border: Border.all(width: 0.08.w,color: Colors.grey)

      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 15.sp),
        child: Column(
          children: [
            AppImage(imageUrl: widget.productImage, width: 50.sp, height: 50.sp, borderRadius: BorderRadius.circular(14.sp)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.sp,vertical: 12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                        color:  Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,maxLines: 1,
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    widget.productdetaiils,
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,maxLines: 1,
                  ),   SizedBox(height: 0.5.h,),
                  Text(
                    widget.productPrice+' EGP',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,maxLines: 1,
                  ),
                  SizedBox(height: 1.5.h,),
                  Row(
                    children: [
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(vertical: 4.0.sp),
                          itemSize: 16.sp,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,

                          ), onRatingUpdate: (rating) {
                          print(rating);
                        },),
                      ),
                      AppSVG(assetName: 'cart',color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
