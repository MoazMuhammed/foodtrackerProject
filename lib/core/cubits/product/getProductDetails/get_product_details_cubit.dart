import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/cart/data/getProductDetails.dart';
import 'package:meta/meta.dart';

part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit() : super(GetProductDetailsInitial());
  List<Products> productDetails = [];

  getProductDetails({required int Id})async{
    var response = await MyDio.get(endPoint: EndPoints.productDetails+Id.toString()+'/');

    GetProductDetails getProductDetails = GetProductDetails.fromJson(response!.data);
    productDetails = getProductDetails.products;
    safePrint(response.data);

    safePrint(response.toString());
    emit(GetProductDetailsSuccess(response.data.toString()));

  }


}
