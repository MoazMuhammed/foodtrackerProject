import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'payment_cart_state.dart';

class PaymentCartCubit extends Cubit<PaymentCartState> {
  PaymentCartCubit() : super(PaymentCartInitial());
  postUser(String? name,String? address,String? phone)async{
   var response = await MyDio.post(endPoint: EndPoints.addUserItem,data: {
      "name": MyShared.getString(key: MySharedKeys.name),
      "address": address,
      "phone": MyShared.getString(key: MySharedKeys.phone)
    });
   try{
     if(response!.statusCode == 200) {
       emit(PaymentCartSuccess(response!.data.toString()));
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
     if(response.statusCode == 400) {
       emit(PaymentCartFailure(response!.data));
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
     emit(PaymentCartFailure(response!.data.toString()));
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
