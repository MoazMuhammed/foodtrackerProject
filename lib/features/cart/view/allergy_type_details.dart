import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/cart/widget/recommended_product_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllergyTypesDetailsScreen extends StatefulWidget {
  const AllergyTypesDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AllergyTypesDetailsScreen> createState() => _AllergyTypesDetailsScreenState();
}

class _AllergyTypesDetailsScreenState extends State<AllergyTypesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ForgetPasswordBarWidget(onPressed: () => pop(context), title: "Allergy Product Details"),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.sp,horizontal: 18.sp),
                child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 19,
                        mainAxisExtent: 270),
                    itemCount: 10,
                    itemBuilder: (
                        context,
                        index,
                        ) {
                      return RecommendedProductWidget(productImage: '', productName: '', productPrice: '', productdetaiils: '',);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
