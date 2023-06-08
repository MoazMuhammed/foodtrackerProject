import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/profile/data/editPostModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  EditPostCubit() : super(EditPostInitial());
  EditPostModel editPostModel = EditPostModel();

  editPosts({required int Id , String? title , String? image , int? allergy })async{
    var response = await MyDio.update(endPoint: EndPoints.deletePost+Id.toString()+'/',
        fromData: FormData.fromMap({
          "title": title,
           "image": image != null ? await MultipartFile.fromFile(image) : image,
          "allergy": allergy,
          "owner": MyShared.getInt(key: MySharedKeys.UID),
        }));
    try {
      if(response!.statusCode == 200 ){
        emit(EditPostSuccess("The Post edit Successfully"));
        Fluttertoast.showToast(
            msg: "The Post edit Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp);
        safePrint(response.data);
      }
      if(response.statusCode == 400 ){
        emit(EditPostFailure("You have enter all data"));
        Fluttertoast.showToast(
            msg: "You have enter all data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp);
        safePrint(response.data);
      }
    } catch (e) {
      if(response!.statusCode == 400 ){
        emit(EditPostFailure("You have enter all data"));
        Fluttertoast.showToast(
            msg: "You have enter all data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp);
        safePrint(response.data);
      }

      safePrint(response!.data);

    }
  }
}


