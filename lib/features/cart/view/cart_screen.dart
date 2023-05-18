import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/categoy/get/allergy_type_cubit.dart';
import 'package:foodtracker/core/cubits/product/getProductRecommended/product_recommended_cubit.dart';
import 'package:foodtracker/core/cubits/product/goToCart/push_to_cart_cubit.dart';
import 'package:foodtracker/core/cubits/product/pushRating/push_rating_cubit.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/cart/data/getProductRecommended.dart';
import 'package:foodtracker/features/cart/view/allergy_type_details.dart';
import 'package:foodtracker/features/cart/widget/recommended_product_widget.dart';
import 'package:foodtracker/features/category/data/getAllergyModel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cubit = ProductRecommendedCubit();
  final cubitPushRating = PushRatingCubit();
  final cubitAllergies = ProductRecommendedCubit();
  final cubitAllergyType = AllergyTypeCubit();
  final cubitAddToCart = PushToCartCubit();
  GetAllergyModel getAllergyModel = GetAllergyModel();

  @override
  void initState() {
    cubit.getProductRecommended();
    cubitAllergyType.getAllergyType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitAddToCart,
      child: BlocProvider(
        create: (context) => cubitAllergyType,
        child: BlocProvider(
          create: (context) => cubit,
          child: BlocProvider(
            create: (context) => cubitPushRating,
            child: BlocConsumer<PushToCartCubit, PushToCartState>(
              listener: (context, state) {
                if (state is AllergyTypeLoading) {
                  showLoading();
                }
                if (state is AllergyTypeSuccess) {
                  hideLoading();
                }
                if (state is AllergyTypeFailure) {
                  hideLoading();
                  showError("Error");
                }
              },
              builder: (context, state) {
                return BlocConsumer<AllergyTypeCubit, AllergyTypeState>(
                  listener: (context, state) {
                    if (state is AllergyTypeLoading) {
                      showLoading();
                    }
                    if (state is AllergyTypeSuccess) {
                      hideLoading();
                    }
                    if (state is AllergyTypeFailure) {
                      hideLoading();
                      showError("Error");
                    }
                  },
                  builder: (context, state) {
                    return BlocConsumer<PushRatingCubit, PushRatingState>(
                      listener: (context, state) {
                        if (state is ProductRecommendedLoading) {
                          showLoading();
                        }
                        if (state is ProductRecommendedSuccess) {
                          hideLoading();
                        }
                        if (state is ProductRecommendedFailure) {
                          hideLoading();
                          showError("Error");
                        }
                      },
                      builder: (context, state) {
                        return BlocConsumer<ProductRecommendedCubit,
                            ProductRecommendedState>(
                          listener: (context, state) {
                            if (state is ProductRecommendedLoading) {
                              showLoading();
                            }
                            if (state is ProductRecommendedSuccess) {
                              hideLoading();
                            }
                            if (state is ProductRecommendedFailure) {
                              hideLoading();
                              showError("Error");
                            }
                          },
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.sp, vertical: 18.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppBarWidget(),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text("Allergy Types",
                                      style: TextStyle(fontSize: 17.sp)),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: ListView.builder(
                                      itemCount: cubitAllergyType
                                          .getAllergyModel.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        GetAllergyModel getAllergyModel =
                                            cubitAllergyType
                                                .getAllergyModel[index];

                                        return InkWell(
                                          onTap: () => push(
                                              context,
                                              AllergyTypesDetailsScreen(
                                                idAllergyType:
                                                    getAllergyModel.id.toInt(),
                                              )),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.sp,
                                                vertical: 10.sp),
                                            width: 40.w,
                                            child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                AppImage(
                                                    imageUrl: getAllergyModel
                                                        .miniAllergyPic,
                                                    width: 50.sp,
                                                    height: 50.sp,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.sp)),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 13.sp,
                                                      horizontal: 13.sp),
                                                  child: Text(
                                                    getAllergyModel.englishName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.sp,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? Colors.white
                                                            : Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text("Recommended Products",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white)),
                                      Spacer(),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.sp),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Expanded(
                                      flex: 5,
                                      child: GridView.builder(
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 15,
                                                  mainAxisExtent: 282),
                                          itemCount:
                                              cubit.productRecommended.length,
                                          itemBuilder: (
                                            context,
                                            index,
                                          ) {
                                            GetProductRecommended
                                                getProductRecommended =
                                                cubit.productRecommended[index];
                                            PushRatingCubit pushRating =
                                                PushRatingCubit();
                                            return RecommendedProductWidget(
                                              productImage:
                                                  'http://http://16.16.212.179/' +
                                                      getProductRecommended
                                                          .image,
                                              productName: getProductRecommended
                                                  .englishName,
                                              productPrice:
                                                  getProductRecommended.price
                                                      .toString(),
                                              productdetaiils:
                                                  getProductRecommended
                                                      .englishDescription,
                                              onRatingUpdate: (double value) {
                                                cubitPushRating.pushRateItem(
                                                    ID: getProductRecommended.id
                                                        .toInt(),
                                                    rating: value);
                                              },
                                              addToCart: () {
                                                cubitAddToCart.addItemToCart(product_id: getProductRecommended.id.toInt() );
                                              },
                                            );
                                          })),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
