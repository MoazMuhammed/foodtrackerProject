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
  List<Comments> comments = [];

  getPost() async {
    var response = await MyDio.get(endPoint: EndPoints.posts);
    List  data = [];
      data = response!.data;
    posts = data
        .map((postJson) => PostsModel.fromJson(postJson))
        .toList()
        .reversed
        .toList();



    comments = posts.map((post) => post.comments).expand((comments) => comments).toList();



    safePrint(response);
    emit(GetPostsSuccess("successMessage"));
  }
}
