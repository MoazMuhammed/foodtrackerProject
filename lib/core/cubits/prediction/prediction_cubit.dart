import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/AI/data/predictModel.dart';
import 'package:meta/meta.dart';

part 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  PredictionCubit() : super(PredictionInitial());
  PredictModel predictModel = PredictModel();

  imagePrediction({required String image}) async {
    showLoading();
    var response = await MyDio.postFile(endPoint: EndPoints.prediction, fromData: FormData.fromMap({
      "image" : await MultipartFile.fromFile(image)
    }) );
    try{
    predictModel = PredictModel.fromJson(response!.data);
    if(response.statusCode == 200){
    safePrint(response);
    hideLoading();
    emit(PredictionSuccess(response.data.toString()));
    }
    if(response.statusCode == 404){
      showError(response.data.toString());
    }
    }catch (e) {
      print (e);
    }
  }
}
