import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/login_user/editUserData/push_editing_user_data_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/pick_image_dialog.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditPersonalInformation extends StatefulWidget {
  const EditPersonalInformation({Key? key}) : super(key: key);

  @override
  State<EditPersonalInformation> createState() =>
      _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditPersonalInformation> {
  final cubit = PushEditingUserDataCubit();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  File? _image;
  final pickedFile = ImagePicker();

  uploadImage(ImageSource source) async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        cubit.pushUserData(Id: MyShared.getInt(key: MySharedKeys.UID).toInt(),
            image: _image!.path.toString(),
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<PushEditingUserDataCubit, PushEditingUserDataState>(
        listener: (context, state) {
          if (state is PushEditingUserDataLoading) {
            showLoading();
          }
          if (state is PushEditingUserDataSuccess) {
            hideLoading();
          }
          if (state is PushEditingUserDataFailure) {
            hideLoading();
            showError("Error");
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ForgetPasswordBarWidget(
                      onPressed: () => pop(context),
                      title: "Edit Personal Information"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.sp, vertical: 20.sp),
                    child: Row(
                      children: [
                        Stack(children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.2.w),
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: AppImage(
                                  imageUrl: 'http://10.0.2.2:8000//' +
                                      MyShared.getString(
                                          key: MySharedKeys.userImage),
                                  width: 35.sp,
                                  height: 35.sp,
                                  borderRadius: BorderRadius.circular(20.sp)))
                        ]),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Update Your Picture",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 0.9.h,
                              ),
                              AppButton(
                                onPressed: () {
                                  dialogBuilder(context, () {
                                    uploadImage(ImageSource.camera);
                                  }, () {
                                    uploadImage(ImageSource.gallery);
                                  });
                                },
                                label: "Update",
                                sizeFont: 16.sp,
                                borderRadius: BorderRadius.circular(12.sp),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 30.sp,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 1.sp),
                                bgColor: AppColors.primary,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppTextField(
                      hint: MyShared.getString(key: MySharedKeys.name),
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      title: "Name *"),
                  AppTextField(
                    hint: MyShared.getString(key: MySharedKeys.email),
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(),
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    title: "Email *",
                    enable: false,
                  ),
                  AppTextField(
                    hint: MyShared.getString(key: MySharedKeys.phone),
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,
                    title: "Phone Number *",
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppButton(
                    onPressed: () {
                      cubit.pushUserData(Id: MyShared.getInt(key: MySharedKeys.UID),username: nameController.text,phone: phoneController.text);
                    },
                    label: "Update",
                    sizeFont: 16.sp,
                    borderRadius: BorderRadius.circular(11.sp),
                    bgColor: AppColors.primary,
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
