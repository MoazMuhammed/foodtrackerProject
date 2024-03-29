import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/prediction/prediction_cubit.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/core/widgets/app_button.dart';
import 'package:foodtracker/features/AI/ai/check%20data/view/check_data_enter.dart';
import 'package:foodtracker/features/AI/view/ai_analysis_screen.dart';
import 'package:foodtracker/features/AI/widget/choose_process_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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
    var pickedImage = await pickedFile.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      pop(context);
      await cubit.imagePrediction(image: _image!.path);
    }
  }

  uploadImageWithGallery() async {
    var pickedImage = await pickedFile.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      pop(context);
      await cubit.imagePrediction(image: _image!.path);

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

  final cubit = PredictionCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<PredictionCubit, PredictionState>(
        listener: (context, state) {
          if (state is PredictionLoading) {
            showLoading();
          }
          if (state is PredictionSuccess) {
            hideLoading();
            push(
                context,
                AiAnalysisScreen(
                  file: _image!,
                  categoryName: cubit.predictModel.categoryName,
                  allergies: cubit.predictModel.allergies,
                  foodName: cubit.predictModel.foodName,
                ));
          }

          if (state is PredictionFailure) {
            hideLoading();
            showError("Error");

          }
        },
        builder: (context, state) {
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
                      "${S().chooseService}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ChooseProcessWidget(
                      image: "photoAnalysis",
                      title: "${S().photoAnalysis}",
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
                                              color: Colors.black
                                                  .withOpacity(0.5)),
                                          borderRadius:
                                              BorderRadius.circular(12.sp)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${S().chooseType}",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white)),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          AppButton(
                                              onPressed: () {
                                                requestCameraPermission();
                                              },
                                              label: "${S().camera}",
                                              sizeFont: 16.sp,
                                              bgColor: AppColors.primary),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          AppButton(
                                            onPressed: () {
                                              uploadImageWithGallery();
                                            },
                                            label: "${S().gallery}",
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
                                        label: "${S().back}",
                                        sizeFont: 16.sp,
                                        bgColor: AppColors.container),
                                  ))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      description: "${S().photoAnalysisNote}",
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ChooseProcessWidget(
                      image: "medical",
                      title: "${S().medicalAnalysis}",
                      onPressed: () => push(context, CheckDataEnter()),
                      description: "${S().medicalAnalysisNote}",
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
