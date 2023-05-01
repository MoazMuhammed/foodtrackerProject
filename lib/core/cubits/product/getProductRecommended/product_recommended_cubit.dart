import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/cart/data/getProductRecommended.dart';
import 'package:meta/meta.dart';

part 'product_recommended_state.dart';

class ProductRecommendedCubit extends Cubit<ProductRecommendedState> {
  ProductRecommendedCubit() : super(ProductRecommendedInitial());
  List<GetProductRecommended> productRecommended = [];
  
  getProductRecommended()async{
    var response = await MyDio.get(endPoint: EndPoints.productRecommended);
    List data = [];
    safePrint(response!.data);
    data = response!.data;
    productRecommended = data
        .map((postJson) => GetProductRecommended.fromJson(postJson))
        .toList()
        .reversed
        .toList();

    safePrint(response);
    emit(ProductRecommendedSuccess("successMessage"));

  }

}
