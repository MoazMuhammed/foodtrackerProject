import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/cart/data/pushRating.dart';
import 'package:meta/meta.dart';

part 'push_rating_state.dart';

class PushRatingCubit extends Cubit<PushRatingState> {
  PushRatingCubit() : super(PushRatingInitial());
  PushRating pushRating = PushRating();
  
  pushRateItem({required int ID, double? rating}) async{
    var response = await MyDio.post(endPoint: EndPoints.rateProduct,
        data: {
          "rating": rating
        }
    );
    safePrint(response!.data);
    emit(PushRatingSuccess("s"));


  }
}
