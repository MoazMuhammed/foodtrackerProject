import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/Home/data/addCommentModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit() : super(AddCommentInitial());

  AddCommentModel addCommentModel = AddCommentModel();

  postComment({required int postID, String? text}) async {
    emit(AddCommentLoading());
    var response = await MyDio.post(
        endPoint: EndPoints.addComment, data: {"text": text, "post": postID});
    try {
      addCommentModel = AddCommentModel.fromJson(response!.data);
      if(response.statusCode == 201 ){
        emit(AddCommentSuccess("Add Post Successfully"));
        Fluttertoast.showToast(
            msg: "Add Post Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp);
        safePrint(response.data);
      }
      if(response.statusCode == 400 ){
        emit(AddCommentSuccess("Add Post Successfully"));
        Fluttertoast.showToast(
            msg: "You didn't add comment",
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
        emit(AddCommentSuccess("Add Post Successfully"));
        Fluttertoast.showToast(
            msg: "You didn't add comment",
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
