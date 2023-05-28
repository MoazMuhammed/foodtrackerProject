import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/categoy/get/allergy_type_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/category/category_details/view/category_details_screen.dart';
import 'package:foodtracker/features/category/data/getAllergyModel.dart';
import 'package:foodtracker/features/category/widget/card_allergy_type_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}



class _CategoryScreenState extends State<CategoryScreen> {

  final cubit = AllergyTypeCubit();
  GetAllergyModel getAllergyModel = GetAllergyModel();

  @override
  void initState() {

    cubit.getAllergyType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocConsumer<AllergyTypeCubit, AllergyTypeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarWidget(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 20.sp),
            child: Text("${S().allergyType}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp,color:  Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white),),
          ),
          Expanded(
            child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 19,
                    mainAxisExtent: 240),
                itemCount: cubit.getAllergyModel.length,
                itemBuilder: (context, index) {
                  GetAllergyModel getAllergyModel = cubit.getAllergyModel[index];
                  return InkWell(
                    onTap: () => push(context, CategoryDetailsScreen(Id: getAllergyModel.id.toInt(),)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          AppImage(imageUrl:getAllergyModel.miniAllergyPic, width: double.infinity, height: double.infinity, borderRadius: BorderRadius.circular(14.sp)),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 16.sp,vertical: 12.sp),
                            child: Text(
                              MyShared.getCurrentLanguage() == "en"? getAllergyModel.englishName : getAllergyModel.arabicName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,fontSize: 16.sp),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )        ],
      ),
    );
  },
),
);
  }
}
