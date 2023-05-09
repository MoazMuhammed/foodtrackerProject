part of 'get_cart_details_cubit.dart';

@immutable
abstract class GetCartDetailsState {}

class GetCartDetailsInitial extends GetCartDetailsState {}
class GetCartDetailsLoading extends GetCartDetailsState {}
class GetCartDetailsSuccess extends GetCartDetailsState {
  final String successMessage;

  GetCartDetailsSuccess(this.successMessage);

}
class GetCartDetailsFailure extends GetCartDetailsState {
  final String failureMassege;

  GetCartDetailsFailure(this.failureMassege);

}
