import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecommendedProductWidget extends StatefulWidget {
  const RecommendedProductWidget({Key? key, required this.productImage, required this.productName, required this.productPrice, required this.productdetaiils, required this.onRatingUpdate, required this.addToCart, required this.ratePressed, required this.rating}) : super(key: key);
  final String productImage;
  final String productName;
  final String productPrice;
  final String productdetaiils;
  final double rating;
  final ValueChanged<double> onRatingUpdate;
  final GestureTapCallback addToCart;
  final GestureTapCallback ratePressed;


  @override
  State<RecommendedProductWidget> createState() => _RecommendedProductWidgetState();
}

class _RecommendedProductWidgetState extends State<RecommendedProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),border: Border.all(width: 0.08.w,color: Colors.grey)

      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 15.sp),
        child: Column(
          children: [
            Expanded(child: AppImage(imageUrl: widget.productImage, width: double.infinity, height: double.infinity, borderRadius: BorderRadius.circular(14.sp))),
            SizedBox(height: 1.h,),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.sp,vertical: 1.sp),
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
                      textAlign: TextAlign.start
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RatingBarIndicator(
                            rating: widget.rating,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.sp,
                            direction: Axis.horizontal,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: TextButton(onPressed: widget.ratePressed, child: Text("rate",style: TextStyle(fontSize: 15.sp),)),
                          flex: 1,
                        )
                        // AppSVG(assetName: 'cart',color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white)
                      ],
                    ),
                    Expanded(child: AppButton(onPressed: widget.addToCart, label: "Add to cart", sizeFont: 14.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(12.sp),margin: EdgeInsets.symmetric(horizontal: 8.sp),))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
