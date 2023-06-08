import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/contactUS/data/contactUsModel.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  ContactUsModel contactUsModel = ContactUsModel();
  userContactUs({required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    var response = await MyDio.post(
        endPoint: EndPoints.contactUs, data: {
      "name": name,
      "email": email,
      "phone": phone,
      "message": message,
    });
    try{
      contactUsModel = ContactUsModel.fromJson(response!.data);
      if(response.statusCode == 201) {
        emit(ContactUsSuccess(response!.data.toString()));
        Fluttertoast.showToast(
            msg: "${response.data.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
        safePrint(contactUsModel.message);
      }
      if(response.statusCode == 400) {
        emit(ContactUsFailure(response!.data.toString()));
        Fluttertoast.showToast(
            msg: "${response.data.toString()}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: AppColors.primary,
            fontSize: 14.sp
        );
        safePrint(response.data.toString());
      }
    }catch(e){
      emit(ContactUsFailure(response!.data.toString()));
      Fluttertoast.showToast(
          msg: "${response.data.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: AppColors.primary,
          fontSize: 14.sp
      );
      safePrint(e);
    }
  }
  }
