import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/categoy/category_details_cubit.dart';
import 'package:foodtracker/core/cubits/categoy/get/allergy_type_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_enter.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
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
                    const AppBarDataCheckWidget(title: 'Allergy Type',),
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
                              child: AppImage(imageUrl: cubit.categoryDetailsModel.allergyPic, width: double.infinity, height: 20.h, borderRadius: BorderRadius.circular(16.sp)),
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
                      cubit.categoryDetailsModel.englishDescription,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                    )),
                    Text(
                      "Details :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        cubit.categoryDetailsModel.englishName,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Text(
                      "Symptoms and signs :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        cubit.categoryDetailsModel.englishSymptoms,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Text(
                      "protection :",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: Text(
                        cubit.categoryDetailsModel.englishProtection,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Read food labels carefully",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    SizedBox(height: 1.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 14.sp),
                      child: Row(
                        children: [
                          Text(
                            "To See How To Analysis Food",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                          Expanded(
                            child: AppButton(
                                onPressed: () {
                                  push(context,CheckDataEnter() );
                                }, label: "Quick Access", sizeFont: 14.sp,bgColor: AppColors.primary,borderRadius: BorderRadius.circular(14.sp),margin: EdgeInsets.symmetric(horizontal: 14.sp)),
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
