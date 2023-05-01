part of 'product_recommended_cubit.dart';

@immutable
abstract class ProductRecommendedState {}

class ProductRecommendedInitial extends ProductRecommendedState {}
class ProductRecommendedLoading extends ProductRecommendedState {}
class ProductRecommendedSuccess extends ProductRecommendedState {
  final String successMessage;

  ProductRecommendedSuccess(this.successMessage);

}
class ProductRecommendedFailure extends ProductRecommendedState {
  final String failureMassege;

  ProductRecommendedFailure(this.failureMassege);

}
