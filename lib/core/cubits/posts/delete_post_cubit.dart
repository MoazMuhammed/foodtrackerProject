import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';

part 'delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostCubit() : super(DeletePostInitial());
  deletePosts({required int Id})async{
    var response = await MyDio.delete(endPoint: EndPoints.deletePost+Id.toString()+'/');
    safePrint(response);
    emit(DeletePostSuccess("Deleted"));
  }
}
