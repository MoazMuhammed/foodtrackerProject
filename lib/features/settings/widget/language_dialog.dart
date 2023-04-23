import 'package:flutter/material.dart';
import 'package:foodtracker/core/cubits/language/language_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguageDialog extends StatefulWidget {
  LanguageDialog({Key? key}) : super(key: key);

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // <-- SEE HERE
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp))),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 12.sp),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 15.sp),
        height: 16.h,
        child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  this.context.read<LanguageCubit>().changeLanguageToEn();
                },
                child: Text("English", style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 16.sp),),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () {
                  this.context.read<LanguageCubit>().changeLanguageToAr();
                },
                child: Text("Arabic", style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 16.sp)),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
