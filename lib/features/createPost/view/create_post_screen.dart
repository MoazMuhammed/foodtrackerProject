import 'dart:io';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/posts/post/posts_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/contactUS/widget/message_widget.dart';
import 'package:foodtracker/features/createPost/widget/allergySelected.dart';
import 'package:foodtracker/features/createPost/widget/create_post_bar_widget.dart';
import 'package:foodtracker/features/createPost/widget/spinner_widget.dart';
import 'package:foodtracker/features/createPost/widget/uploadFile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {

  TextEditingController textController = TextEditingController();
  SingleValueDropDownController allergySelected = SingleValueDropDownController();

  File? _image;
  final pickedFile = ImagePicker();
  final cubit = PostsCubit();



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
      create: (context) => cubit,
      child: BlocListener<PostsCubit, PostsState>(
        listener: (context, state) {
          if (state is PostsLoading) {
            showLoading();
          }
          if (state is PostsSuccess) {
            hideLoading();
            showSuccess("Published!");
            pop(context);
          }
          if (state is PostsFailure) {
            hideLoading();
            showError(state.failureMessage);
          }
        },
        child: SafeArea(
            child: Scaffold(
                body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreatePostBarWidget(
                  onPressed: () {
                    if(_image != null  ){
                      safePrint("message");
                      cubit.pushPosts(
                          title: textController.text,
                          image: _image!.path,
                          // allergy: allergySelected.dropDownValue!.value,
                          // owner: MyShared.getInt(key: MySharedKeys.UID)
                      );

                    }else{
                      showError("You have to enter text and image");
                    }
                  },
                  title: " Post"),
              SizedBox(
                height: 4.h,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.sp),
                  child: Row(
                    children: [
                      AppImage(
                          imageUrl:
                          'http://10.0.2.2:8000//'+MyShared.getString(key: MySharedKeys.userImage),
                          width: 30.sp,
                          height: 30.sp,
                          borderRadius: BorderRadius.circular(30.sp)),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Moaz Muhamed ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            ),
                        SizedBox(height: 1.h,),
                            Container(
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
                                dropDownList:  [
                                  DropDownValueModel(
                                      name: "Egg Allergy", value: 1),
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MessageWidget(
                  hint: "Show What's in your Mind ….",
                  keyboardType: TextInputType.text,
                  controller: textController,
                  isPassword: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  borderRadius: BorderRadius.circular(20.sp),
                  minLine: 9,
                  maxLine: 11,
                ),
              ),
              Spacer(),
              UploadFile(
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
              )
            ],
          ),
        ))),
      ),
    );
  }
}
