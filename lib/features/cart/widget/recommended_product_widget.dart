import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecommendedProductWidget extends StatefulWidget {
  const RecommendedProductWidget({Key? key}) : super(key: key);

  @override
  State<RecommendedProductWidget> createState() => _RecommendedProductWidgetState();
}

class _RecommendedProductWidgetState extends State<RecommendedProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),color:  Theme.of(context) == Brightness.light ?Colors.black:Colors.grey.shade800

      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
        child: Column(
          children: [
            AppImage(imageUrl: "https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg", width: 50.sp, height: 50.sp, borderRadius: BorderRadius.circular(14.sp)),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.sp,vertical: 12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SIMPLE MILLS PUMPKIN MUFFIN',
                    style: TextStyle(
                        color:  Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,maxLines: 1,
                  ),
                  SizedBox(height: 0.3.h,),
                  Text(
                    '120 EGP',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light ?Colors.white:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,maxLines: 1,
                  ),
                  SizedBox(height: 0.5.h,),
                  RatingBar.builder(
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
                  },)
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
