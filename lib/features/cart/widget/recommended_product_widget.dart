import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecommendedProductWidget extends StatefulWidget {
  const RecommendedProductWidget({Key? key, required this.productImage, required this.productName, required this.productPrice, required this.productdetaiils, required this.onRatingUpdate, required this.addToCart}) : super(key: key);
  final String productImage;
  final String productName;
  final String productPrice;
  final String productdetaiils;
  final ValueChanged<double> onRatingUpdate;
  final GestureTapCallback addToCart;


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
            AppImage(imageUrl: widget.productImage, width: 40.sp, height: 40.sp, borderRadius: BorderRadius.circular(14.sp)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.productName,
                      style: TextStyle(
                          color:  Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.start,maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    widget.productPrice+' EGP',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,maxLines: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(vertical: 4.0.sp),
                          itemSize: 16.sp,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,

                          ), onRatingUpdate: widget.onRatingUpdate,
                          ),
                        flex: 2,
                      ),
                      Expanded(
                        child: TextButton(onPressed: () {
                          
                        }, child: Text("rate")),
                        flex: 1,
                      )
                      // AppSVG(assetName: 'cart',color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)
                    ],
                  ),
                  AppButton(onPressed: widget.addToCart, label: "Add to cart", sizeFont: 14.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(12.sp),margin: EdgeInsets.symmetric(horizontal: 12.sp),)
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
