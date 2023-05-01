import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/Home/data/likeModel.dart';
import 'package:meta/meta.dart';

part 'likes_state.dart';

class LikesCubit extends Cubit<LikesState> {
  LikesCubit() : super(LikesInitial());
  LikeModel likeModel = LikeModel();

  likes({required int id}) async{
    emit(LikesLoading());
    var response = await MyDio.post(endPoint: 'addposts/${id}/like/');
    try {
      likeModel = LikeModel.fromJson(response!.data);
      emit(LikesSuccess("successMessage"));
      safePrint(response.data);
    }catch(e){
      emit(LikesFailure("failureMessage"));
    }
  }
}
