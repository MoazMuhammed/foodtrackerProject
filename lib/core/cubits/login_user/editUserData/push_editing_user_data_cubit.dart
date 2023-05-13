import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/settings/editPersonalInformation/data/pushUserDataModel.dart';
import 'package:meta/meta.dart';

part 'push_editing_user_data_state.dart';

class PushEditingUserDataCubit extends Cubit<PushEditingUserDataState> {
  PushEditingUserDataCubit() : super(PushEditingUserDataInitial());
  PushUserDataModel pushUserDataModel = PushUserDataModel();

  pushUserData({required int Id,String? username , String? image , int? email,String? phone})async{
    var response = await MyDio.update(endPoint: EndPoints.editUserData+MyShared.getInt(key: MySharedKeys.UID).toString()+'/',
        fromData: FormData.fromMap({
          "username": username,
          "profile_pic": image != null ? await MultipartFile.fromFile(image) : image,
          "phone": phone,
          "email": email,
        }));
    saveUserData();
    safePrint(response);
  }

  saveUserData(){
    MyShared.putString(key: MySharedKeys.email, value: pushUserDataModel.email);
    MyShared.putString(key: MySharedKeys.name, value: pushUserDataModel.username);
    MyShared.putString(key: MySharedKeys.pic, value: pushUserDataModel.profilePic);
    MyShared.putString(key: MySharedKeys.phone, value: pushUserDataModel.phone);
    MyShared.putString(key: MySharedKeys.userImage, value: pushUserDataModel.profilePic);
  }

}
