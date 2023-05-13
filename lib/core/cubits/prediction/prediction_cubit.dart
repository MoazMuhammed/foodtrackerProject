import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/AI/data/predictModel.dart';
import 'package:meta/meta.dart';

part 'prediction_state.dart';

class PredictionCubit extends Cubit<PredictionState> {
  PredictionCubit() : super(PredictionInitial());
  PredictModel predictModel = PredictModel();

  imagePrediction({required String image}) async {
    var response = await MyDio.postFile(endPoint: EndPoints.prediction, fromData: FormData.fromMap({
      "image" : await MultipartFile.fromFile(image)
    }) );
    safePrint(response);
  }
}
