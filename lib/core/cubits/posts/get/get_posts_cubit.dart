import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/Home/data/postsModel.dart';
import 'package:meta/meta.dart';
part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit() : super(GetPostsInitial());
  List<PostsModel> posts = [];

  getPost() async {
    var response = await MyDio.get(endPoint: EndPoints.posts);
    List  data = [];
    safePrint(response!.data);
      data = response.data;
    posts = data
        .map((postJson) => PostsModel.fromJson(postJson))
        .toList()
        .reversed
        .toList();
    safePrint(response);
    emit(GetPostsSuccess("successMessage"));
  }

  getPostFromSearch({required String text}) async {
    var response = await MyDio.get(endPoint: EndPoints.posts+'?search=${text}');
    List  data = [];
    safePrint(response!.data);
      data = response.data;
    posts = data
        .map((postJson) => PostsModel.fromJson(postJson))
        .toList()
        .reversed
        .toList();
    safePrint('search'+response.toString());
    emit(GetPostsSuccess("successMessage"));
  }
}
