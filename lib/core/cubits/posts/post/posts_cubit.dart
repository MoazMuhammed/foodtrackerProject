import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/Home/data/postsModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());
  PostsModel postsModel = PostsModel();

  pushPosts({required String title, required String image, required int allergy,required int owner}) async {
    emit(PostsLoading());
    var response = await MyDio.postFile(endPoint: EndPoints.posts,
        fromData: FormData.fromMap({
      "title": title,
      "image": await MultipartFile.fromFile(image),
      "allergy": allergy,
      "owner": owner,
    }));
    try{

        postsModel = PostsModel.fromJson(response!.data);
        emit(PostsSuccess("Published!"));
        safePrint(response.data);

    }catch(e){
      emit(PostsFailure("You have to enter text and image"));
    }
  }
}
