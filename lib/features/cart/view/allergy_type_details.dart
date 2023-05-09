import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/categoy/get/allergy_type_cubit.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/cart/data/getProductDetails.dart';
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

  @override
  void initState() {
    cubit.getProductDetails(Id: widget.idAllergyType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                                  mainAxisExtent: 270),
                          itemCount: cubit.productDetails.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            Products products = cubit.productDetails[index];

                            return RecommendedProductWidget(
                              productImage: products.image  ,
                              productName: products.englishName,
                              productPrice: products.price.toString(),
                              productdetaiils: '',
                              onRatingUpdate: (double value) {}, addToCart: () {  },
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
    );
  }
}
