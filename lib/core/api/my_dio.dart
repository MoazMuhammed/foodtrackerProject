import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';

class MyDio {
  static late Dio dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );

    dio = Dio(baseOptions);
  }

  static Future<Response?> get({required String endPoint}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };
    return await dio.get(endPoint);
  }

  static Future<Response?> post({required String endPoint, Map<String, dynamic>?data}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };
    return await dio.post(endPoint, data: data);
  }

  static Future<Response?> delete({required String endPoint}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };
    return await dio.delete(endPoint);
  }

  static Future<Response?> update({required String endPoint}) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };
    return await dio.put(endPoint);
  }
}
