import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/login/data/loginUserModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitial());
  LoginUserModel loginUserModel = LoginUserModel();

  userUserLogin({required String email, required String password}) async {
    emit(LoginUserLoading());
    var response = await MyDio.postLogin(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password});
    try {
      loginUserModel = LoginUserModel.fromJson(response!.data);
      if (loginUserModel.status) {
        emit(LoginUserSuccess(loginUserModel.data.token));
        Fluttertoast.showToast(
            msg: "${loginUserModel.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );

        safePrint(response.data);
        await saveUserData();
        safePrint(MyShared.getString(key: MySharedKeys.apiToken));
      } if(!loginUserModel.status) {
        emit(LoginUserFailure(loginUserModel.data.token));
        Fluttertoast.showToast(
            msg: "${loginUserModel.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
        safePrint(response.data);


      }
    } catch (e) {
      emit(LoginUserFailure(loginUserModel.data.email));
      safePrint(e);
      Fluttertoast.showToast(
          msg: "Your Email or password is wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: AppColors.primary,
          fontSize: 14.sp
      );

    }
  }

  saveUserData(){
    MyShared.putString(key: MySharedKeys.apiToken, value: loginUserModel.data.token);
    MyShared.putString(key: MySharedKeys.email, value: loginUserModel.data.email);
    MyShared.putString(key: MySharedKeys.name, value: loginUserModel.data.username);
    MyShared.putString(key: MySharedKeys.phone, value: loginUserModel.data.phone);
    MyShared.putBoolean(key: MySharedKeys.is_doctor, value: loginUserModel.data.isDoctor);
    MyShared.putInt(key: MySharedKeys.UID, value: loginUserModel.data.id.toInt());
  }
}
