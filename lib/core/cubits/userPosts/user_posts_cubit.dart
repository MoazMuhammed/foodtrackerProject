import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/profile/data/userPostsModel.dart';
import 'package:meta/meta.dart';

part 'user_posts_state.dart';

class UserPostsCubit extends Cubit<UserPostsState> {
  UserPostsCubit() : super(UserPostsInitial());
  List<UserPostsModel> userPosts = [];

  getUserPost() async {
    var response = await MyDio.get(endPoint: EndPoints.userPosts+MyShared.getInt(key: MySharedKeys.UID).toString()+'//');
      List data = response!.data;
      safePrint("message");

      userPosts = data
          .map((postJson) => UserPostsModel.fromJson(postJson))
          .toList();

      emit(UserPostsSuccess("successMessage"));
    }
  }

