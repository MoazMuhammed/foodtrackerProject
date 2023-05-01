import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/Home/data/addCommentModel.dart';
import 'package:meta/meta.dart';
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
      emit(AddCommentSuccess("Add Post Successfully"));
      safePrint(response.data);
    } catch (e) {
      safePrint(response!.data);

      emit(AddCommentFailure(response.data));
    }
  }
}
