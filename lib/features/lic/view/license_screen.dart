import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/lic/license_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  final cubit = LicenseCubit();

  File? license_pic;
  File? face_pic;
  final pickedFile = ImagePicker();

  uploadImageWithCameraForLicenses() async {
    var pickedImage = await pickedFile.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        license_pic = File(pickedImage.path);
      });
    }
  }

  uploadImageWithCameraForImage() async {
    var pickedImage = await pickedFile.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        face_pic = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<LicenseCubit, LicenseState>(
        listener: (context, state) {
          if (state is LicenseLoading) {
            showLoading();
          }
          if (state is LicenseSuccess) {
            hideLoading();
          }
          if (state is LicenseFailure) {
            hideLoading();
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              children: [
                ForgetPasswordBarWidget(
                    onPressed: () => pop(context), title: "Verify Doctor"),
                SizedBox(
                  height: 6.h,
                ),
                InkWell(
                  onTap: () {
                    uploadImageWithCameraForLicenses();
                  },
                  child: AppTextField(
                    hint: 'Upload',
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: false,
                    enable: false,
                    isImage: true,
                    prefixIcon: Container(
                      child: license_pic != null
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 18.sp),
                              width: 5.h,
                              height: 5.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 6.sp, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Image.file(
                                license_pic!,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                                width: 5.h,
                                height: 5.h,
                              ),
                            )
                          : Container(),
                    ),
                    uploadMedicalId: () {},
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    title: 'Upload Medical ID  ',
                    controller: TextEditingController(),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp),
                  child: Text(
                    "Upload Doctor Image  ",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 0.8.h,
                ),
                InkWell(
                  onTap: () {
                    uploadImageWithCameraForImage();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.sp),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.sp, vertical: 26.sp),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3.sp),
                          borderRadius: BorderRadius.circular(14.sp)),
                      child: Column(
                        children: [
                          Container(
                            child: face_pic != null
                                ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 18.sp),
                              width: 5.h,
                              height: 5.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 6.sp, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Image.file(
                                face_pic!,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                                width: 5.h,
                                height: 5.h,
                              ),
                            )
                                : AppSVG(assetName: "imageUpload"),
                          ),
                          SizedBox(
                            height: 1.2.h,
                          ),
                          Text(
                            "Click Here To Start",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                AppButton(
                    onPressed: () {
                      cubit.pushUserData(
                          license_pic: license_pic!.path.toString(),
                          face_pic: face_pic!.path.toString());
                    },
                    label: "Confirm",
                    bgColor: AppColors.primary,
                    sizeFont: 16.sp)
              ],
            ),
          ));
        },
      ),
    );
  }
}
