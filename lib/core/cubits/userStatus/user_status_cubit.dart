import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/profile/data/userStatus.dart';
import 'package:meta/meta.dart';

part 'user_status_state.dart';

class UserStatusCubit extends Cubit<UserStatusState> {
  UserStatusCubit() : super(UserStatusInitial());
  UserStatus userStatus = UserStatus();

  getUserStatus()async{
    try {
      emit(UserStatusLoading());

      var response = await MyDio.get(endPoint: EndPoints.userStatus);

      userStatus = UserStatus.fromJson(response!.data);
      safePrint("Doc => ${userStatus.isDoctor}");
      safePrint("patient => ${userStatus.isPatient}");
      SaveUserStatus();

      emit(UserStatusSuccess(response.data));
      safePrint(response.toString());

    } catch (e) {
      emit(UserStatusFailure(e.toString()));
    }
  }
  SaveUserStatus(){
    MyShared.putBoolean(key: MySharedKeys.userDoctorStatus, value: userStatus.isDoctor);
    MyShared.putBoolean(key: MySharedKeys.userPatientStatus, value: userStatus.isPatient);

  }

}
