part of 'push_to_cart_cubit.dart';

@immutable
abstract class PushToCartState {}

class PushToCartInitial extends PushToCartState {}
class PushToCartLoading extends PushToCartState {}
class PushToCartSuccess extends PushToCartState {
  final String successMessage;

  PushToCartSuccess(this.successMessage);
}
class PushToCartFailure extends PushToCartState {
  final String failureMessage;

  PushToCartFailure(this.failureMessage);
}