import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/forget%20password/data/forgetPasswordModel.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();
  userForgetPassword({
    required String email,
  }) async {
    var response = await MyDio.postLogin(
        endPoint: EndPoints.forgetPassword, data: {
      "email": email,

    });
    try{
      forgetPasswordModel = ForgetPasswordModel.fromJson(response!.data);
      if(forgetPasswordModel.status == true) {
        emit(ForgetPasswordSuccess(forgetPasswordModel.message.toString()));
        safePrint(forgetPasswordModel.message);
      }
      if(forgetPasswordModel.status == false) {
        emit(ForgetPasswordFailure(forgetPasswordModel.message.toString()));
        safePrint(response.data.toString());
      }
    }catch(e){
      emit(ForgetPasswordFailure(response!.data.toString()));
      safePrint(e);
    }
  }
}
