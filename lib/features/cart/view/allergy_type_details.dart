import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/product/goToCart/push_to_cart_cubit.dart';
import 'package:foodtracker/core/cubits/rate/rate_products_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/cart/data/getProductAllergy.dart';
import 'package:foodtracker/features/cart/widget/rating_widget.dart';
import 'package:foodtracker/features/cart/widget/recommended_product_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/cubits/product/getProductDetails/get_product_details_cubit.dart';

class AllergyTypesDetailsScreen extends StatefulWidget {
  const AllergyTypesDetailsScreen({Key? key, required this.idAllergyType}) : super(key: key);
final int idAllergyType;
  @override
  State<AllergyTypesDetailsScreen> createState() =>
      _AllergyTypesDetailsScreenState();
}

class _AllergyTypesDetailsScreenState extends State<AllergyTypesDetailsScreen> {
  final cubit = GetProductDetailsCubit();
  final cubitPushRatingProducts = RateProductsCubit();
  final cubitAddToCart = PushToCartCubit();

  @override
  void initState() {
    cubit.getProductDetails(Id: widget.idAllergyType);
    super.initState();
  }
  late double value;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubitAddToCart,
  child: BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<GetProductDetailsCubit, GetProductDetailsState>(
        listener: (context, state) {
          if (state is GetProductDetailsLoading) {
            showLoading();
          }
          if (state is GetProductDetailsSuccess) {
            hideLoading();
          }
          if (state is GetProductDetailsFailure) {
            hideLoading();
            showError("Error");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  ForgetPasswordBarWidget(
                      onPressed: () => pop(context),
                      title: "Allergy Product Details"),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 18.sp),
                      child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 25,
                                  mainAxisSpacing: 19,
                                  mainAxisExtent: 275),
                          itemCount: cubit.productDetails.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            GetProductAllergy products = cubit.productDetails[index];

                            return RecommendedProductWidget(
                              productImage: "https://moazmuhammed.pythonanywhere.com/"+products.image  ,
                              productName:MyShared.getCurrentLanguage() == "en"? products.englishName : products.arabicName,
                              productPrice: products.price.toString(),
                              productdetaiils: '',
                              onRatingUpdate: (double value) {}, addToCart: () {
                              cubitAddToCart.addItemToCart(product_id: products.id.toInt() );
                            }, ratePressed: () { addReview(context, () {
                              cubitPushRatingProducts.userRateProducts(rating: value.toInt(), id: products.id.toInt());
                            }, (rate) {
                                value = rate;
                                safePrint(value);
                            });
                            }, rating: products.rating.toDouble() == null ? 0 : products.rating.toDouble(),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
);
  }
}
