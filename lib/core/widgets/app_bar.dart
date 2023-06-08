import 'package:flutter/material.dart';
import 'package:foodtracker/core/cubits/product/getDataToCart/get_cart_details_cubit.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/features/cart/view/check_data_screen.dart';
import 'package:foodtracker/features/createPost/view/create_post_screen.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}
final cubit = GetCartDetailsCubit();


class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  void initState() {
    cubit.getCartDetails();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => pushAndRemoveUntil(context, MainScreens()),
          child: Row(
            children: [
              AppSVG(
                assetName: 'logo',
                height: 4.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                height: 4.h,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide( width: 0.2.w, color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white
                        ),
    )),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Food Tracker',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              )
            ],
          ),
        ),
        const Spacer(),
        InkWell(onTap: () => push(context, CheckDataScreen()),child: Stack(
          alignment: Alignment.topLeft,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppSVG(assetName: 'cart', height: 2.9.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,),
              ),
              Text(cubit.cartDetails.length.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),

            ])),
        SizedBox(
          width: 3.w,
        ),
        GestureDetector(
            onTap: () => push(context, CreatePostScreen()),
            child: AppSVG(assetName: 'addPost', height: 2.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
        SizedBox(
          width: 3.w,
        ),
        GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: AppSVG(assetName: 'drawer', height: 3.5.h,color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,)),
      ],
    );
  }
}
