import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/comments/posts/add_comment_cubit.dart';
import 'package:foodtracker/core/cubits/posts/edit/edit_post_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/createPost/widget/allergySelected.dart';
import 'package:foodtracker/features/createPost/widget/uploadFile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditPostScreen extends StatefulWidget {
  @override
  State<EditPostScreen> createState() => _EditPostScreenState();

  EditPostScreen(this.id, this.text, this.imgUrl);

  final int id;
  final String text;
  final String imgUrl;
}

class _EditPostScreenState extends State<EditPostScreen> {
  final SingleValueDropDownController allergySelected =
      SingleValueDropDownController();
  final TextEditingController editPostController = TextEditingController();

  File? _image;
  final pickedFile = ImagePicker();
  final cubitEditPost = EditPostCubit();

  uploadImageWithCamera() async {
    var pickedImage = await pickedFile.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  uploadVideoWithCamera() async {
    var pickedImage = await pickedFile.pickVideo(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  uploadVideoWithGallery() async {
    var pickedImage = await pickedFile.pickVideo(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  uploadImageWithGallery() async {
    var pickedImage = await pickedFile.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return uploadImageWithCamera();
    } else if (status.isDenied) {
      var result = await Permission.camera.request();
      if (result.isGranted) {
        return uploadImageWithCamera();
      } else if (result.isPermanentlyDenied) {
        openAppSettings();
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitEditPost,
      child: BlocConsumer<EditPostCubit, EditPostState>(
        listener: (context, state) {
          if (state is AddCommentLoading) {
            showLoading();
          }
          if (state is AddCommentSuccess) {
            hideLoading();
          }
          if (state is AddCommentFailure) {
            hideLoading();
            showError("Error");
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ForgetPasswordBarWidget(
                          onPressed: () => pop(context), title: "Edit Post"),
                      SizedBox(
                        height: 6.h,
                      ),
                      AppTextField(
                          hint: widget.text,
                          keyboardType: TextInputType.text,
                          controller: editPostController,
                          isPassword: false,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          title: "Edit Text"),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 19.sp, vertical: 8.sp),
                        child: Container(
                          height: 6.h,
                          child: DropDownTextFormField(
                            validators: (value) {
                              if (value.toString().isEmpty) {
                                return "enter Allergy Type";
                              }
                              return null;
                            },
                            hint: "Allergy Types",
                            controller: allergySelected,
                            enabled: false,
                            count: 6,
                            dropDownList: [
                              DropDownValueModel(name: "Egg Allergy", value: 1),
                              DropDownValueModel(
                                  name: "Wheat Allergy", value: 2),
                              DropDownValueModel(
                                  name: "Milk Allergy", value: 3),
                              DropDownValueModel(
                                  name: "Nuts Allergy", value: 4),
                              DropDownValueModel(
                                  name: "Fish Allergy", value: 5),
                              DropDownValueModel(
                                  name: "Fish Allergy", value: 6),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 19.sp, vertical: 8.sp),
                        child: _image == null ? AppImage(
                          imageUrl: widget.imgUrl,
                          width: 55.sp,
                          height: 55.sp,
                          borderRadius: BorderRadius.circular(15.sp),
                        ) : Image.file(_image!,height: 55.sp,width: 55.sp,)
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.sp, horizontal: 20.sp),
                        child: UploadFile(
                          onPressed: () {
                            requestCameraPermission();
                          },
                          onPressed1: () {
                            uploadImageWithGallery();
                          },
                          onPressed2: () {
                            uploadVideoWithCamera();
                          },
                          onPressed3: () {
                            uploadVideoWithGallery();
                          },
                        ),
                      ),
                      SizedBox(height: 7.h),
                      AppButton(
                          bgColor: AppColors.primary,
                          borderRadius: BorderRadius.circular(14.sp),
                          onPressed: () {
                            cubitEditPost.editPosts(
                                Id: widget.id,
                                title: editPostController.text,
                                allergy: allergySelected.dropDownValue!.value,
                                image:  _image!.path.toString() );
                            pop(context);
                          },
                          label: "Save",
                          sizeFont: 16.sp)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
