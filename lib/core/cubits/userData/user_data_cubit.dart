import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/profile/data/userDataModel.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  UserDataModel userData = UserDataModel();

  getUserDetails({required id})async{
    try {
      emit(UserDataLoading());

      var response = await MyDio.get(endPoint: EndPoints.userProfile + id.toString()+'/');

      userData = UserDataModel.fromJson(response!.data);
      safePrint(userData.username);
      emit(UserDataSuccess(response.data));

    } catch (e) {
      emit(UserDataFailure(e.toString()));
    }
  }
}
