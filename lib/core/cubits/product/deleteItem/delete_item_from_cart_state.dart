part of 'delete_item_from_cart_cubit.dart';

@immutable
abstract class DeleteItemFromCartState {}

class DeleteItemFromCartInitial extends DeleteItemFromCartState {}
class DeleteItemFromCartLoading extends DeleteItemFromCartState {}
class DeleteItemFromCartSuccess extends DeleteItemFromCartState {
  final String successMessage;

  DeleteItemFromCartSuccess(this.successMessage);

}
class DeleteItemFromCartFailure extends DeleteItemFromCartState {
  final String failureMassege;

  DeleteItemFromCartFailure(this.failureMassege);

}
