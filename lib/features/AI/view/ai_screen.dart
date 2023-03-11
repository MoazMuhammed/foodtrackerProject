import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_enter.dart';
import 'package:foodtracker/features/AI/widget/choose_process_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({Key? key}) : super(key: key);

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.sp,
          vertical: 18.sp,
        ),
        child: Column(
          children: [
            const AppBarWidget(),
            SizedBox(height: 15.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AI Process",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChooseProcessWidget(image: 'checkData', title: 'Check Data', onPressed: () { push(context, const CheckDataEnter()); },),
                    SizedBox(
                      width: 7.w,
                    ),
                    ChooseProcessWidget(image: 'Ai', title: 'AI', onPressed: () {  },),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
    ));
  }
}
