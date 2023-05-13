import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodtracker/core/cubits/product/deleteItem/delete_item_from_cart_cubit.dart';
import 'package:foodtracker/core/cubits/product/getDataToCart/get_cart_details_cubit.dart';
import 'package:foodtracker/core/cubits/product/updateQuantitiy/update_quantity_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/cart/data/getCartDetailsModel.dart';
import 'package:foodtracker/features/cart/view/cart_payment_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckDataScreen extends StatefulWidget {
  const CheckDataScreen({Key? key}) : super(key: key);

  @override
  State<CheckDataScreen> createState() => _CheckDataScreenState();
}

class _CheckDataScreenState extends State<CheckDataScreen> {
  final cubit = GetCartDetailsCubit();
  final cubitDeleteItem = DeleteItemFromCartCubit();
  final cubitUpdateQuantity = UpdateQuantityCubit();

  @override
  void initState() {
    cubit.getCartDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitUpdateQuantity,
      child: BlocProvider(
        create: (context) => cubitDeleteItem,
        child: BlocProvider(
          create: (context) => cubit,
          child: BlocConsumer<UpdateQuantityCubit, UpdateQuantityState>(
            listener: (context, state) {
              if (state is GetCartDetailsLoading) {
                showLoading();
              }
              if (state is GetCartDetailsSuccess) {
                hideLoading();
              }
              if (state is GetCartDetailsFailure) {
                hideLoading();
                showError("Error");
              }
            },
            builder: (context, state) {
              return BlocConsumer<DeleteItemFromCartCubit,
                  DeleteItemFromCartState>(
                listener: (context, state) {
                  if (state is GetCartDetailsLoading) {
                    showLoading();
                  }
                  if (state is GetCartDetailsSuccess) {
                    hideLoading();
                  }
                  if (state is GetCartDetailsFailure) {
                    hideLoading();
                    showError("Error");
                  }
                },
                builder: (context, state) {
                  return BlocConsumer<GetCartDetailsCubit, GetCartDetailsState>(
                    listener: (context, state) {
                      if (state is GetCartDetailsLoading) {
                        showLoading();
                      }
                      if (state is GetCartDetailsSuccess) {
                        hideLoading();
                      }
                      if (state is GetCartDetailsFailure) {
                        hideLoading();
                        showError("Error");
                      }
                    },
                    builder: (context, state) {
                      return SafeArea(
                          child: Scaffold(
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ForgetPasswordBarWidget(
                                onPressed: () => pop(context),
                                title: "Check Cart"),
                            Expanded(
                              child: ListView.builder(
                                itemCount: cubit.cartDetails.length,
                                itemBuilder: (context, index) {
                                  Items items = cubit.cartDetails[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.sp, vertical: 15.sp),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.sp, vertical: 12.sp),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border: Border.all(
                                            color: Colors.black, width: 3.sp),
                                        borderRadius:
                                            BorderRadius.circular(20.sp),
                                      ),
                                      child: Row(
                                        children: [
                                          AppImage(
                                              imageUrl: items.product.image,
                                              width: 30.sp,
                                              height: 30.sp,
                                              borderRadius:
                                                  BorderRadius.circular(15.sp)),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    items.product.englishName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.sp,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                  SizedBox(
                                                    width: 45.w,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        cubitDeleteItem
                                                            .deleteItem(
                                                                Id: items.id
                                                                    .toInt());
                                                      },
                                                      icon: Icon(Icons.close)),
                                                ],
                                              ),
                                              RatingBar.builder(
                                                initialRating: 5,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 4.0.sp),
                                                itemSize: 16.sp,
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (value) {},
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.2.w,
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                    ),
                                                    child: InkWell(
                                                        onTap: () {
                                                          cubitUpdateQuantity.updateQuantity(Id: items.id.toInt(), quantity: items.quantity.toInt()+1);
                                                        },
                                                        child: Icon(
                                                            CupertinoIcons
                                                                .plus)),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Text("1"),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.2.w,
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                    ),
                                                    child: InkWell(
                                                      child: Icon(
                                                          CupertinoIcons.minus),
                                                      onTap: () {
                                                        cubitUpdateQuantity.updateQuantity(Id: items.id.toInt(), quantity: items.quantity.toInt()-1);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 33.w,
                                                  ),
                                                  Text(
                                                    items.product.price
                                                            .toString() +
                                                        ' EGP',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.sp, vertical: 12.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order Summary",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Subtotal",
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      Spacer(),
                                      Text(
                                        cubit.CartDetails.totalPrice
                                                .toString() +
                                            ' EGP',
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
                                      ),
                                      Spacer(),
                                      Text(
                                        cubit.CartDetails.totalPrice
                                                .toString() +
                                            ' EGP',
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 0.3.w,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Grand Total",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.sp),
                                            ),
                                            Text(
                                              cubit.CartDetails.totalPrice
                                                      .toString() +
                                                  ' EGP',
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: AppButton(
                                            onPressed: () {
                                              push(
                                                  context,
                                                  PaymentCartScreen(
                                                    totalPrice: cubit
                                                        .CartDetails.totalPrice
                                                        .toString(),
                                                  ));
                                            },
                                            label: "Checkout",
                                            sizeFont: 16.sp,
                                            bgColor: AppColors.primary,
                                            borderRadius:
                                                BorderRadius.circular(12.sp)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
