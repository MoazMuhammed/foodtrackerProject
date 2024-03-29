import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/signup/signupScreen/data/registerModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../styles/colors.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  RegisterModel signUpModel = RegisterModel();

  userRegister(
      {required String username,
      required String email,
      required String phone,
      required String password1,
      required String password2,
      }) async {
    var response = await MyDio.postLogin(endPoint:MyShared.getBoolean(key: MySharedKeys.isDoctor)  == true ? EndPoints.registerDoctor : EndPoints.registerPatient, data: {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password1,
      "password_again": password2,
    });
    try{
      signUpModel = RegisterModel.fromJson(response!.data);
      if( signUpModel.status == true) {
        emit(SignUpSuccess(signUpModel.message.toString()));
        safePrint(signUpModel.message);
        Fluttertoast.showToast(
            msg: "${response.data.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
      }
     if(signUpModel.status == false) {
        emit(SignUpFailure(signUpModel.message));
        safePrint(response.data.toString());
        Fluttertoast.showToast(
            msg: "${response.data.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
      }
    }catch(e){
      emit(SignUpFailure(signUpModel.message.toString()));
      safePrint(e);
      Fluttertoast.showToast(
          msg: "${response!.data.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: AppColors.primary,
          fontSize: 14.sp
      );
    }
  }
}
