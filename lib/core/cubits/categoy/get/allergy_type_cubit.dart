import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/category/data/getAllergyModel.dart';
import 'package:meta/meta.dart';

part 'allergy_type_state.dart';

class AllergyTypeCubit extends Cubit<AllergyTypeState> {
  AllergyTypeCubit() : super(AllergyTypeInitial());
 List <GetAllergyModel> getAllergyModel = [];
  getAllergyType() async{

    var response = await MyDio.get(endPoint: EndPoints.getCategory);
    List data = [];

    safePrint(response!.data);

    data = response!.data;
    getAllergyModel = data
        .map((postJson) => GetAllergyModel.fromJson(postJson))
        .toList()
        .reversed
        .toList();


    emit(AllergyTypeSuccess(response.data.toString()));

  }
}
