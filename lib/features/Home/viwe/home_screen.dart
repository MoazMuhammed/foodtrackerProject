import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/core/widgets/app_text_faild.dart';
import 'package:foodtracker/features/Home/widget/reacts_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    AppSVG(
                      assetName: 'logo',
                      height: 4.h,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                      height: 4.h,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.black, width: 0.2.w))),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'Food Tracker',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
                Spacer(),
                AppSVG(assetName: 'notify', height: 2.5.h),
                SizedBox(
                  width: 3.w,
                ),
                AppSVG(assetName: 'addPost', height: 2.5.h),
                SizedBox(
                  width: 3.w,
                ),
                AppSVG(assetName: 'drawer', height: 2.h),
              ],
            ),
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 2.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppSVG(
                          assetName: 'profile',
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Moaz Muhammed",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp)),
                            Text(
                              '3 min',
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          'Follow',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        AppSVG(assetName: 'points')
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Text(
                          'There are many variations of passages of Lorem Ipsum available',
                          style: TextStyle(fontSize: 14.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 1.4.h,
                    ),
                    Image(
                        image: AssetImage('assets/images/post.png'),
                        fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.sp),
                          border: Border.all(
                              width: 0.2.w, color: Colors.grey.shade400),
                        ),
                        child: Row(
                          children: [
                            ReactWidget(
                              image: 'love',
                              number: '35',
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            ReactWidget(
                              image: 'happy',
                              number: '7',
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            ReactWidget(
                              image: 'sad',
                              number: '2',
                              onPressed: () {},
                            ),
                            Spacer(),
                            AppSVG(assetName: 'comment'),
                            SizedBox(
                              width: 3.w,
                            ),
                            AppSVG(assetName: 'save')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
