import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/cart/data/getProductAllergy.dart';
import 'package:meta/meta.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit() : super(GetProductDetailsInitial());
 List <GetProductAllergy> productDetails = [];

  getProductDetails({required int Id})async{
    var response = await MyDio.get(endPoint: EndPoints.productDetails+Id.toString()+'/allergy_products/');
    List  data = [];
    safePrint(response!.data);
    data = response!.data;
    productDetails = data
        .map((postJson) => GetProductAllergy.fromJson(postJson))
        .toList()
        .reversed
        .toList();
emit(GetProductDetailsSuccess("successMessage"));

  }


}
