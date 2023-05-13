import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';

part 'payment_cart_state.dart';

class PaymentCartCubit extends Cubit<PaymentCartState> {
  PaymentCartCubit() : super(PaymentCartInitial());
  postUser(String? name,String? address,String? phone)async{
   var response = await MyDio.post(endPoint: EndPoints.addUserItem,data: {
      "name": name,
      "address": address,
      "phone": phone
    });
   safePrint(response!.data.toString());
emit(PaymentCartSuccess(response!.data.toString()));
  }
}
