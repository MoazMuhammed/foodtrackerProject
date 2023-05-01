import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/app_bar_data_widget.dart';
import 'package:foodtracker/features/AI/ai/check%20data/widget/dialog_check_data_widget.dart';
import 'package:foodtracker/features/drawer/widget/drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class CheckDataEnter extends StatefulWidget {
  const CheckDataEnter({Key? key}) : super(key: key);

  @override
  State<CheckDataEnter> createState() => _CheckDataEnterState();
}

class _CheckDataEnterState extends State<CheckDataEnter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          endDrawer: const DrawerWidget(name: "Moaz"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarDataCheckWidget(title: 'Check Data',),
              SizedBox(height: 8.h,),
              const AppSVG(assetName: "medicalAnalysis"),
              SizedBox(height: 5.h,),
              Text("Medical Analysis",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 1.h,),
              Text("Medical Analyzes Are A Feature Provided By The Program So That The User Or Any Person Can View And Interpret The Results Of The Analyzes Without The Need For A Doctor",style: TextStyle(fontSize: 14.sp),textAlign: TextAlign.center),
              SizedBox(height: 5.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.warning_amber_rounded,color: Colors.red,),
                  Text("Warning",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                ],
              ),


              SizedBox(height: 1.h,),
              Text("This result is not 100% correct. In the event that the symptoms were very serious, you should go to the nearest doctor or hospital.",style: TextStyle(fontSize: 14.sp),textAlign: TextAlign.center),
             SizedBox(height: 5.h,),
              SizedBox(
                height: 5.h,
                child: AppButton(onPressed: () {
                 showDialog(context: context, builder: (context) => const DialogCheckDataWidget(),) ;
                }, label: "Start Now", sizeFont: 16.sp),
              ),
            ],
          ),
        ),
      ),
    ));
  }

}


