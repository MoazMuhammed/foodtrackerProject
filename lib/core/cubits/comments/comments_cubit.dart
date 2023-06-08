import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/Home/data/commentPostModel.dart';
import 'package:meta/meta.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());
  List<CommentPostModel> comment = [];

  getPost({required int id}) async {

    var response = await MyDio.get(endPoint: "posts/$id/comments/");
    List  data = [];
    safePrint(response!.data);
    data = response!.data;
    comment = data
        .map((postJson) => CommentPostModel.fromJson(postJson))
        .toList()
        .reversed
        .toList();

    safePrint(response);
    emit(CommentsSuccess("successMessage"));
  }
}
