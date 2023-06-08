import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:meta/meta.dart';

part 'delete_item_from_cart_state.dart';

class DeleteItemFromCartCubit extends Cubit<DeleteItemFromCartState> {
  DeleteItemFromCartCubit() : super(DeleteItemFromCartInitial());
  
  deleteItem({required int Id})async{
    MyDio.delete(endPoint: EndPoints.deleteItem+Id.toString()+'/');
  }
}
