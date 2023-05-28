import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/contactUS/data/contactUsModel.dart';
import 'package:meta/meta.dart';

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
        emit(ContactUsSuccess(message.toString()));
        safePrint(contactUsModel.message);
      }
      if(response.statusCode == 400) {
        emit(ContactUsFailure(message.toString()));
        safePrint(response.data.toString());
      }
    }catch(e){
      emit(ContactUsFailure(response!.data.toString()));
      safePrint(e);
    }
  }
  }
