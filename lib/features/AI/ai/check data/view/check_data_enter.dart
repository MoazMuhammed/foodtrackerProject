import 'package:flutter/material.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/core/widgets/app_text_faild.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_result.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:foodtracker/features/AI/view/ai_screen.dart';
import 'package:foodtracker/main_screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class CheckDataEnter extends StatefulWidget {
  const CheckDataEnter({Key? key}) : super(key: key);

  @override
  State<CheckDataEnter> createState() => _CheckDataEnterState();
}

class _CheckDataEnterState extends State<CheckDataEnter> {
  final TextEditingController inputController = TextEditingController();
  late int getValue ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarDataCheckWidget(),
              AppTextField(hint: 'Enter IGE Total Number', keyboardType: TextInputType.text, controller: inputController, isPassword: false, textInputAction: TextInputAction.done, textInputType: TextInputType.text),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: () {
                  getValue = int.parse(inputController.text) ;
                  MyShared.putInt(key: MySharedKeys.iGE, value: getValue);
                  push(context,CheckDataResult());
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [AppSVG(assetName: 'circule',width: 45.w), Text("click For Start Analysis",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
