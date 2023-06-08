import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'license_state.dart';

class LicenseCubit extends Cubit<LicenseState> {
  LicenseCubit() : super(LicenseInitial());
  pushUserData({required String license_pic , required String face_pic})async{
    var response = await MyDio.postFile(endPoint: EndPoints.lic,
        fromData: FormData.fromMap({
          "license_pic":  await MultipartFile.fromFile(license_pic) ,
          "face_pic":  await MultipartFile.fromFile(face_pic) ,
        }));
    try{
      if( response!.statusCode == 200 ) {
        safePrint(response.toString());
        Fluttertoast.showToast(
            msg: "Files uploaded successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
      }

  }catch(e){
      if( response!.statusCode == 400 ) {
        safePrint(response.toString());
        Fluttertoast.showToast(
            msg: "Files can't uploaded",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
      }

    }
  }

}
