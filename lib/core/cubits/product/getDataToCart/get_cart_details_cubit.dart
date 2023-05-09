import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/cart/data/getCartDetailsModel.dart';
import 'package:meta/meta.dart';
part 'get_cart_details_state.dart';

class GetCartDetailsCubit extends Cubit<GetCartDetailsState> {
  GetCartDetailsCubit() : super(GetCartDetailsInitial());
  List<Items> cartDetails = [];
  GetCartDetailsModel CartDetails = GetCartDetailsModel();

  getCartDetails()async{
    var response = await MyDio.get(endPoint: EndPoints.addCart);
    CartDetails = GetCartDetailsModel.fromJson(response!.data);
    cartDetails = CartDetails.items;

    safePrint(response.toString());
    emit(GetCartDetailsSuccess(response!.data.toString()));

  }

}
