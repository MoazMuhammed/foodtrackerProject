import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_enter.dart';
import 'package:foodtracker/features/AI/widget/choose_process_widget.dart';
import 'package:foodtracker/features/AI/widget/hint_chppse_service_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({Key? key}) : super(key: key);

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  File? _image;
  final pickedFile = ImagePicker();

  uploadImageWithCamera() async {
    var pickedImage = await pickedFile.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  uploadImageWithGallery() async {
    var pickedImage = await pickedFile.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18.sp,
        vertical: 18.sp,
      ),
      child: Column(
        children: [
          const AppBarWidget(),
          SizedBox(
            height: 6.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose Service of Process",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              ChooseProcessWidget(
                image: "photoAnalysis",
                title: "Photo Analysis",
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 30.h,
                        margin: EdgeInsets.all(20.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 55.sp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(12.sp)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Choose type",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold)),
                                    SizedBox(height: 2.h,),
                                    AppButton(
                                        onPressed: () {
                                          uploadImageWithCamera();
                                        },
                                        label: "Camera",
                                        sizeFont: 16.sp,
                                        bgColor: AppColors.primary),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    AppButton(
                                      onPressed: () {
                                        uploadImageWithGallery();
                                      },
                                      label: "Gallery",
                                      sizeFont: 16.sp,
                                      bgColor: AppColors.primary,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 3.h,
                            ),
                            Center(
                                child: InkWell(
                              onTap: () {
                                pop(context);
                              },
                              child: AppButton(
                                  onPressed: () {
                                    pop(context);
                                  },
                                  label: "Back",
                                  sizeFont: 16.sp,
                                  bgColor: AppColors.container),
                            ))
                          ],
                        ),
                      );
                    },
                  );
                },
                description:
                    "to get the type of allergy by analysis the photo using artificial intelligence.",
              ),
              SizedBox(
                height: 3.h,
              ),
              ChooseProcessWidget(
                image: "medical",
                title: "Medical Analysis",
                onPressed: () => push(context, CheckDataEnter()),
                description: "For get the result from medical reports like IGE",
              )
            ],
          ),
        ],
      ),
    );
  }
}
