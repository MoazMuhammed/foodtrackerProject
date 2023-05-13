part of 'payment_cart_cubit.dart';

@immutable
abstract class PaymentCartState {}

class PaymentCartInitial extends PaymentCartState {}
class PaymentCartLoading extends PaymentCartState {}
class PaymentCartSuccess extends PaymentCartState {
  final String successMessage;

  PaymentCartSuccess(this.successMessage);
}
class PaymentCartFailure extends PaymentCartState {
  final String failureMessage;

  PaymentCartFailure(this.failureMessage);
}