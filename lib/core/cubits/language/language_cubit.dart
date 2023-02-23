import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/api/api_result_handler.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared.dart';
import 'package:foodtracker/core/shared_prefrences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/safe_print.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitialState());
  static dynamic language;

  Future<void> getLanguageFromServer() async {
    var value = await MyDio.getData(endPoint: EndPoints.language);

    dynamic language;

    if (value is ApiSuccess) {
      safePrint(value.data);
      language = value.data['data'];
    }
    if (value is ApiFailure) {
      safePrint(value.errorMessage);
      showError(value.errorMessage);
    }

    var keys = jsonEncode(language);

    await MyShared.putString(key: MySharedKeys.languageKeys, value: keys);

    getLanguageFromLocal();
  }

  void getLanguageFromLocal() {
    var stringKeys = MyShared.getString(key: MySharedKeys.languageKeys);

    language = jsonDecode(stringKeys);
  }

  void changeLanguage() async {
    emit(ChangeLanguageState());
  }

  void changeLanguageToEn() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: "en");
    emit(ChangeLanguageState());
  }

  void changeLanguageToAr() async {
    await MyShared.putString(key: MySharedKeys.currentLanguage, value: "ar");
    emit(ChangeLanguageState());
  }
}
