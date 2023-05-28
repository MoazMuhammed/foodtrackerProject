part of 'rate_products_cubit.dart';

@immutable
abstract class RateProductsState {}

class RateProductsInitial extends RateProductsState {}
class RateProductsLoading extends RateProductsState {}
class RateProductsSuccess extends RateProductsState {
  final String successMessage;

  RateProductsSuccess(this.successMessage);
}
class RateProductsFailure extends RateProductsState {
  final String failureMessage;

  RateProductsFailure(this.failureMessage);
}