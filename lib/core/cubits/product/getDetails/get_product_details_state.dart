part of 'get_product_details_cubit.dart';

@immutable
abstract class GetProductDetailsState {}

class GetProductDetailsInitial extends GetProductDetailsState {}
class GetProductDetailsLoading extends GetProductDetailsState {}
class GetProductDetailsSuccess extends GetProductDetailsState {
  final String successMessage;

  GetProductDetailsSuccess(this.successMessage);

}
class GetProductDetailsFailure extends GetProductDetailsState {
  final String failureMassege;

  GetProductDetailsFailure(this.failureMassege);

}
