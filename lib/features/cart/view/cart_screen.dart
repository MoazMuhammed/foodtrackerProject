import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/cubits/categoy/get/allergy_type_cubit.dart';
import 'package:foodtracker/core/cubits/product/getDataToCart/get_cart_details_cubit.dart';
import 'package:foodtracker/core/cubits/product/getProductRecommended/product_recommended_cubit.dart';
import 'package:foodtracker/core/cubits/product/goToCart/push_to_cart_cubit.dart';
import 'package:foodtracker/core/cubits/product/pushRating/push_rating_cubit.dart';
import 'package:foodtracker/core/cubits/rate/rate_products_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/cart/data/getProductRecommended.dart';
import 'package:foodtracker/features/cart/view/allergy_type_details.dart';
import 'package:foodtracker/features/cart/widget/no_data_widget.dart';
import 'package:foodtracker/features/cart/widget/rating_widget.dart';
import 'package:foodtracker/features/cart/widget/recommended_product_widget.dart';
import 'package:foodtracker/features/category/data/getAllergyModel.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cubit = ProductRecommendedCubit();
  final cubitPushRating = PushRatingCubit();
  final cubitPushRatingProducts = RateProductsCubit();
  final cubitAllergies = ProductRecommendedCubit();
  final cubitAllergyType = AllergyTypeCubit();
  final cubitAddToCart = PushToCartCubit();
  GetAllergyModel getAllergyModel = GetAllergyModel();
  final cubitCartDetails = GetCartDetailsCubit();

  @override
  void initState() {
    cubit.getProductRecommended();
    cubitAllergyType.getAllergyType();
    super.initState();
  }

  late double value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubitPushRatingProducts,
  child: BlocProvider(
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
                                  Text("${S().allergyClasses}",
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
                                              cubitAllergyType
                                                  .getAllergyModel[index] == cubitAllergyType.getAllergyModel.isNotEmpty ? NoDataWidget() : AllergyTypesDetailsScreen(
                                                idAllergyType:
                                                getAllergyModel.id.toInt(),
                                              ) ),
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
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 10.sp),
                                                    decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(12.sp)
                                                    ),
                                                    child: Text(
                                                     MyShared.getCurrentLanguage() == "en" ? getAllergyModel.englishName : getAllergyModel.arabicName ,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16.sp,
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness.light
                                                              ? Colors.white
                                                              : Colors.white),
                                                    ),
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
                                      Text("${S().recommendedProducts}",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white)),
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
                                               SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 15,
                                                  mainAxisExtent: 33.h),
                                          itemCount:
                                              cubit.productRecommended.length,
                                          itemBuilder: (
                                            context,
                                            index,
                                          ) {
                                            GetProductRecommended
                                                getProductRecommended =
                                                cubit.productRecommended[index];
                                                PushRatingCubit();
                                            return RecommendedProductWidget(
                                              productImage:
                                                  'https://moazmuhammed.pythonanywhere.com/' +
                                                      getProductRecommended
                                                          .image,
                                              productName:MyShared.getCurrentLanguage() == "en"? getProductRecommended
                                                  .englishName: getProductRecommended
                                                  .arabicName,
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
                                              addToCart: () async{
                                                await cubitCartDetails.getCartDetails();

                                             await cubitAddToCart.addItemToCart(product_id: getProductRecommended.id.toInt() );
                                                setState(() {

                                                });

                                                Fluttertoast.showToast(
                                                    msg: "${S().addToCartSuccessfully}",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.white,
                                                    textColor: AppColors.primary,
                                                    fontSize: 14.sp
                                                );

                                              }, ratePressed: () {
                                                addReview(context, () {
                                                  cubitPushRatingProducts.userRateProducts(rating: value.toInt(), id: getProductRecommended.id.toInt());
                                                }, (rate) {
                                                  value = rate;
                                                  safePrint(value);

                                                });
                                            }, rating: getProductRecommended.rating == null ? 0 :getProductRecommended.rating,
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
    ),
);
  }
}
