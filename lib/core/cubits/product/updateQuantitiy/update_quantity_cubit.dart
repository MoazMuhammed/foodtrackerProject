import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:meta/meta.dart';

part 'update_quantity_state.dart';

class UpdateQuantityCubit extends Cubit<UpdateQuantityState> {
  UpdateQuantityCubit() : super(UpdateQuantityInitial());

  updateQuantity({required int Id, required int quantity }) async {
    var response = await MyDio.patch(
        endPoint: EndPoints.updateQuantity+Id.toString()+'/', fromData: FormData.fromMap({
      "quantity": quantity
    })
    );
    safePrint(response!.data.toString());
  }
}
