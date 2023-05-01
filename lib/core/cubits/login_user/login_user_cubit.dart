import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/login/data/login_user.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit() : super(LoginUserInitial());
  LoginUser loginUserModel = LoginUser();

  userUserLogin({required String email, required String password}) async {
    emit(LoginUserLoading());
    var response = await MyDio.postLogin(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password});
    try {
      loginUserModel = LoginUser.fromJson(response!.data);
      if (loginUserModel.status) {
        emit(LoginUserSuccess(loginUserModel.token));
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
        emit(LoginUserFailure(loginUserModel.token));
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
      emit(LoginUserFailure(loginUserModel.email));
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
    MyShared.putString(key: MySharedKeys.apiToken, value: loginUserModel.token);
    MyShared.putString(key: MySharedKeys.email, value: loginUserModel.email);
    MyShared.putString(key: MySharedKeys.name, value: loginUserModel.name);
    MyShared.putString(key: MySharedKeys.pic, value: loginUserModel.image);
    MyShared.putString(key: MySharedKeys.phone, value: loginUserModel.phone);
    MyShared.putString(key: MySharedKeys.userImage, value: loginUserModel.image);
    MyShared.putBoolean(key: MySharedKeys.is_doctor, value: loginUserModel.isDoctor);
    MyShared.putInt(key: MySharedKeys.UID, value: loginUserModel.id.toInt());


  }
}
