import 'package:flutter/material.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/features/Home/widget/post_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
        child: Column(
          children: [
            AppBarWidget(),
            AppSearch(
              hint: 'Search',
              keyboardType: TextInputType.text,
              controller: TextEditingController(),
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(child: ListView.separated(itemBuilder: (context, index) => PostWidget(),itemCount: 7, separatorBuilder: (BuildContext context, int index) {return Divider(
              color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
            ) ; },))
          ],
        ),
      );
  }
}
