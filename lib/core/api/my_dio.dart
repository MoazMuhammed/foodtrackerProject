import 'dart:io';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/api_result_handler.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/safe_print.dart';


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

  static Future<ApiResults> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.post(
        endPoint,
        data: FormData.fromMap(data!),
        queryParameters: queryParameters,
      );

      safePrint(endPoint);
      safePrint(response.statusCode);
      safePrint(response.statusMessage);
      safePrint(response.data);

      return ApiSuccess(response.data);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        safePrint(e.response!.data);
        safePrint(e.response!.statusCode);
        safePrint('ERROR => ${e.response!.data['message']}');

        return ApiFailure(e.response!.data['message']);
        // return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // safePrint('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure("حدث خطأ حاول مرة اخري1 ");
      }
    } catch (e) {
      return ApiFailure("2 حدث خطأ حاول مرة اخري");
    }
  }

  static Future<ApiResults> uploadFile({
    required String endPoint,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    Dio dio = Dio();
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.post(
        endPoint,
        data: formData,
        queryParameters: queryParameters,
      );
      return ApiSuccess(response.data);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // safePrint(e.message);
        //
        return ApiFailure(e.response!.data['message']);
        // return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // safePrint('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure(e.message);
      }
    } catch (e) {
      return ApiFailure(e.toString());
    }
  }

  static Future<ApiResults> putData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response =
          await dio.put(endPoint, data: data, queryParameters: queryParameters);
      return ApiSuccess(response.data);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // safePrint(e.message);
        //
        return ApiFailure(e.response!.data['message']);
        // return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // safePrint('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure("حدث خطأ حاول مرة اخري");
      }
    } catch (e) {
      return ApiFailure("حدث خطأ حاول مرة اخري");
    }
  }

  static Future<ApiResults> deleteData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.delete(endPoint,
          data: data, queryParameters: queryParameters);
      return ApiSuccess(response.data);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // safePrint(e.message);
        //
        return ApiFailure(e.response!.data['message']);
        // return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // safePrint('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        return ApiFailure("حدث خطأ حاول مرة اخري");
      }
    } catch (e) {
      return ApiFailure("حدث خطأ حاول مرة اخري");
    }
  }

  static Future<ApiResults> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    safePrint('${EndPoints.baseUrl}$endPoint');
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.get(endPoint, queryParameters: queryParameters);
      safePrint(response.data);
      return ApiSuccess(response.data);
    } on SocketException {
      return ApiFailure("لا يوجد اتصال بالانترنت");
    } on FormatException {
      return ApiFailure("حدث خطأ في صيغة البيانات");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        // safePrint(e.message);
        //
        return ApiFailure(e.response!.data['message']);
        // return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        // safePrint('check your connection');
        return ApiFailure("تأكد من اتصالك بالانترنت");
      } else if (e.type == DioErrorType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return ApiFailure("غير قادر علي الاتصال بالسيرفر");
      } else {
        // return ApiFailure(e.message);
        return ApiFailure("Check internet connection");
      }
    } catch (e) {
      return ApiFailure(e.toString());
    }
  }
}
