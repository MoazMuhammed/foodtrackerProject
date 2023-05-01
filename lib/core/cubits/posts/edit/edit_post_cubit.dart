import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/profile/data/editPostModel.dart';
import 'package:meta/meta.dart';

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
    safePrint(response);
  }
}
