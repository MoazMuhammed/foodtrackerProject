import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';

part 'rate_products_state.dart';

class RateProductsCubit extends Cubit<RateProductsState> {
  RateProductsCubit() : super(RateProductsInitial());
  userRateProducts({required int rating,required int id
  }) async {
    var response = await MyDio.post(
        endPoint: EndPoints.rateProduct+id.toString()+'/rate/', data: {
      "rating": rating,
    });
   safePrint(response!.data);
   emit(RateProductsSuccess("successMessage"));

  }
}
