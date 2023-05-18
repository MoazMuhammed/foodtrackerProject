import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';

part 'license_state.dart';

class LicenseCubit extends Cubit<LicenseState> {
  LicenseCubit() : super(LicenseInitial());
  pushUserData({required String license_pic , required String face_pic})async{
    var response = await MyDio.postFile(endPoint: EndPoints.lic,
        fromData: FormData.fromMap({
          "license_pic":  await MultipartFile.fromFile(license_pic) ,
          "face_pic":  await MultipartFile.fromFile(face_pic) ,
        }));
    safePrint(response.toString());

  }

}
