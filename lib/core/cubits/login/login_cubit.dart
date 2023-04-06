import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/login/data/login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel loginModel = LoginModel();

  userLogin({required String email, required String password}) async {
    emit(LoginLoading());
    var response = await MyDio.post(
        endPoint: EndPoints.login,
        data: {"username": email, "password": password});
    try {
      loginModel = LoginModel.fromJson(response!.data);
      if (response.statusCode == 200) {
        emit(LoginSuccess(loginModel.token));
        await saveUserData();
        safePrint(MyShared.getString(key: MySharedKeys.apiToken));
      } if(response.statusCode == "401 Unauthorized") {
        emit(LoginFailure(response.data));
        safePrint(response.data);
      }
    } catch (e) {
      emit(LoginFailure(loginModel.email));
    }
  }
  
  saveUserData(){
    MyShared.putString(key: MySharedKeys.apiToken, value: loginModel.token);
    MyShared.putString(key: MySharedKeys.email, value: loginModel.email);

  }
  
}
