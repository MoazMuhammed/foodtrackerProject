import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/categoy/category_details_cubit.dart';
import 'package:foodtracker/core/cubits/categoy/get/allergy_type_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_enter.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryDetailsScreen extends StatefulWidget {
  CategoryDetailsScreen({Key? key, required this.Id}) : super(key: key);
  final int Id;
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  final cubit = CategoryDetailsCubit();
  final cubitAllergy = AllergyTypeCubit();

  @override
  void initState() {
    cubit.getCategoryDetails(id: widget.Id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: SafeArea(
          child: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
        builder: (context, state) {
          return Scaffold(
            endDrawer:  DrawerWidget(name: "${MyShared.getString(key: MySharedKeys.username)}"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     AppBarDataCheckWidget(title: '${S().allergyType}',),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: Stack(children: [
                        Container(
                          decoration:  BoxDecoration(borderRadius:BorderRadius.circular(15.sp) ),
                          child: Container(
                            decoration: BoxDecoration(
                                  border: Border.all(width: 1.w),
                                  borderRadius: BorderRadius.circular(12.sp),
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white),
                            child: Container(decoration: BoxDecoration(
                                border: Border.all(width: 0.1.w),
                                borderRadius: BorderRadius.circular(12.sp),
                                color: Theme.of(context).brightness ==
                                    Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                              child: AppImage(imageUrl: "https://moazmuhammed.pythonanywhere.com/"+cubit.categoryDetailsModel.allergyPic, width: double.infinity, height: 20.h, borderRadius: BorderRadius.circular(16.sp)),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                        child: Text(
                          MyShared.getCurrentLanguage() == "en"?  cubit.categoryDetailsModel.englishName : cubit.categoryDetailsModel.arabicName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                    )),
                    Text(
                      "${S().details}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        MyShared.getCurrentLanguage() == "en"?  cubit.categoryDetailsModel.englishDescription : cubit.categoryDetailsModel.arabicDescription,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Text(
                      "${S().symptomsAndSigns}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        MyShared.getCurrentLanguage() == "en"?  cubit.categoryDetailsModel.englishSymptoms : cubit.categoryDetailsModel.arabicSymptoms,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Text(
                      "${S().protection}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        MyShared.getCurrentLanguage() == "en"?  cubit.categoryDetailsModel.englishProtection : cubit.categoryDetailsModel.arabicProtection,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 14.sp),
                      child: Row(
                        children: [
                          Text(
                            "${S().howToAnalysisFood}",

                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                          Expanded(
                            child: AppButton(
                                onPressed: () {
                                  push(context,CheckDataEnter() );
                                }, label: "${S().quickAccess}", sizeFont: 14.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(14.sp),margin: EdgeInsets.symmetric(horizontal: 14.sp)),
                         flex: 2,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
