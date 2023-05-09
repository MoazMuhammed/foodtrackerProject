import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/cart/data/addToCartModel.dart';
import 'package:meta/meta.dart';

part 'push_to_cart_state.dart';

class PushToCartCubit extends Cubit<PushToCartState> {
  PushToCartCubit() : super(PushToCartInitial());
  AddToCartModel addToCartModel = AddToCartModel();

  addItemToCart({required int product_id})async{
    var response = await MyDio.post(endPoint: EndPoints.addCart,
    data: {
      "product_id" : product_id,
      "quantity" : 1});
    safePrint(response!.data.toString());
    emit(PushToCartSuccess(response.data.toString()));
  }
}
