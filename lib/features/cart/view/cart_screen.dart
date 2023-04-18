import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/cart/widget/recommended_product_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarWidget(),
          SizedBox(height: 2.h,),
          Text("Food brands",style: TextStyle(fontSize: 17.sp)),
          SizedBox(height: 1.h,),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                width: 30.w,
                child: AppImage(imageUrl: "https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg", width: 20.sp, height: 20.sp, borderRadius: BorderRadius.circular(14.sp)),
                ),
              ),
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              Text("Recommended Products",style: TextStyle(fontSize: 18.sp, color:  Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white
              )),
              Spacer(),
              Text("See All",style: TextStyle(color: Colors.blue,fontSize: 15.sp),)
            ],
          ),
          SizedBox(height: 2.h,),

          Expanded(
            flex: 5,
          child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 19,
                  mainAxisExtent: 270),
              itemCount: 10,
              itemBuilder: (context, index,)  {
             return RecommendedProductWidget();
              })),
        ],
      ),
    );
  }
}
