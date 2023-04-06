import 'package:flutter/material.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/help%20center/widget/contact_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ForgetPasswordBarWidget(
                onPressed: () => pop(context), title: "Help Center"),
            SizedBox(
              height: 3.h,
            ),
            AppSVG(assetName: "helpCenter"),
            SizedBox(
              height: 5.h,
            ),
            Text("How Can I Help You?",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              "making it look like readable English. Many\ndesktop publishing packages and web\npage editors now use Lorem Ipsum as\ntheir default model text, and a search",
              style: TextStyle(
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactWidget(
                    image: 'fbContact',
                    pressed: () {
                      launchUrlString("https://web.facebook.com/moaz.mohames");
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ContactWidget(
                    image: 'emailContact',
                    pressed: () {launchUrlString("https://mail.google.com/mail/u/0/#inbox");},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            )
          ],
        ),
      ),
    );
  }
}
