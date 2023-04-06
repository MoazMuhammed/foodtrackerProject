import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/signup/signupScreen/data/sign_up_model.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  SignUpModel signUpModel = SignUpModel();

  userRegister(
      {required String username,
      required String first_name,
      required String last_name,
      required String email,
      required String phone,
      required String password1,
      required String password2,
         String? profile_pic
      }) async {
    var response = await MyDio.post(endPoint: EndPoints.register, data: {
      "username": username,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "phone": phone,
      "password1": password1,
      "password2": password2,
      "profile_pic" :profile_pic,
    });
    try{
      signUpModel = SignUpModel.fromJson(response!.data);
        emit(SignUpSuccess(signUpModel.token));
        safePrint(signUpModel.token);
     if(response.statusCode == 400) {
        emit(SignUpFailure(response.data));
        safePrint(response.data);
      }
    }catch(e){
      emit(SignUpFailure(response!.data));
    }
  }
}
